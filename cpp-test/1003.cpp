#include <iostream>
#include <fstream>
#include <vector>
#include <list>
#include <climits>
#include <queue>

#define DEBUG if(1)
#define IS_DEBUG true

#ifdef IS_DEBUG
#define in fin
#else
#define in cin
#endif


using namespace std;


struct Edge {
    int to;
    int weight;
    Edge(int t, int w): to(t), weight(w) {}
    Edge(): to(0), weight(0) {}
};

struct Dist {
    int id; // use to index
    int dist;

    Dist(int i, int d): id(i), dist(d) {}
};

struct CompareDist {
    bool operator() (Dist &a, Dist &b) {
        return a.dist > b.dist;
    }
};

int dfs(vector<bool> & visited, const vector<list<int> > pres, const vector<int> teams, int cur) {
    int count = teams[cur];
    int max = 0;

    for (list<int>::const_iterator it = pres[cur].begin(); it != pres[cur].end(); ++ it) {
        if (visited[*it]) continue;
        visited[*it] = true;
        int tmp = dfs(visited, pres, teams, *it);
        if (tmp > max) max = tmp;
        visited[*it] = false;
    }

    return count + max;
}

int main () {
    int N, edges, s, d;
    ifstream fin("in.txt");

    in >> N >> edges >> s >> d;
    vector<int> teams(N);
    vector<list<Edge> > neighbors(N);
    priority_queue<Dist, vector<Dist>, CompareDist> dists;
    vector<int> ds(N);
    vector<int> ways(N);
    vector<list<int> > pres(N);
    vector<bool> visited(N);

    for (int i = 0; i < N; ++i) {
        in >> teams[i];

        if (i == s) {
            dists.push(Dist(i, 0));
            ds[i] = 0;
            ways[i] = 1;
        } else {
            //dists.push(Dist(i, INT_MAX));
            ways[i] = 0;
            ds[i] = INT_MAX;
        }
        visited[i] = false;
    }
    for (int i = 0; i < edges; ++i) {
        int f, t, w;
        in >> f >> t >> w;
        neighbors[f].push_back(Edge(t, w));
        neighbors[t].push_back(Edge(f, w));
    }

    while (!dists.empty()) {
        Dist node = dists.top();
        dists.pop();
        int i = node.id;
        //di = node.dist;

        if (i == d) { // 如果找到目的节点，可以直接退出
            DEBUG cout << "reaching distination " <<  i << endl;
            break;
        }

        if (visited[i]) {
            continue;
        }
        DEBUG cout << "visiting node " << i << endl;
        visited[i] = true;

        // 更新邻居节点的信息，同时加入队列
        for (list<Edge>::iterator it=neighbors[i].begin(); it != neighbors[i].end(); ++ it) {
            int to = it->to;
            int w = it->weight;
            //DEBUG cout << "node neighbor " << to << endl;
            if (visited[to]) {
                continue;
            }

            if (ds[to] > (ds[i] + w)) {
                ds[to] = ds[i] + w;
                dists.push(Dist(to, ds[to]));
                DEBUG cout << "update dist for node " << to << endl;

                pres[to].clear();
                pres[to].push_back(i);
                ways[to] = ways[i];
            } else if (ds[to] == (ds[i] + w)) {
                pres[to].push_back(i);
                ways[to] += ways[i];

                DEBUG cout << "update pres for node " << to << endl;
            }
        }
    }

    if (IS_DEBUG) {
        for (int i = 0; i < N; ++i) {
            cout << "distance for node " << i << " is " << ds[i] << endl;
            cout << "ways for node " << i << " is " << ways[i] << endl;
            cout << "pres for node " << i << " is : ";
            for (list<int>::const_iterator it = pres[i].begin(); it != pres[i].end(); ++ it) {
                cout << *it << " ";
            }
            cout << endl;
        }
    }

    //// recover path using a Q
    //queue<int> Q;
    //Q.push(d);
    //vector<bool> selected(N);
    //for (int i = 0; i < N; ++i) {
        //selected[i] = false;
    //}
    //while (!Q.empty()) {
        //int u = Q.front();
        //Q.pop();

        //if (selected[u]) continue;
        //selected[u] = true;

        //for (list<int>::const_iterator it = pres[u].begin(); it != pres[u].end(); ++ it) {
            //if (!selected[*it]) Q.push(*it);
        //}
    //}

    //// count total teams
    //int count = 0;
    //for (int i = 0; i < N; ++i) {
        //if (selected[i]) count += teams[i];
    //}
    //DEBUG cout << "total number of teams is " << count << endl;
    //
    //
    int count = 0;
    vector<bool> selected(N);
    for (int i = 0; i < N; ++i) {
        selected[i] = false;
    }
    count = dfs(selected, pres, teams, d);
    cout << ways[d] << " " << count << endl;
}
