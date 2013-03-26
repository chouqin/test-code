def logging_decorator(func):
    def wrapper():
        wrapper.count += 1
        print "The function I modify has been called {0} times(s).".format(
            wrapper.count)
        func()

    wrapper.count = 0
    return wrapper

@logging_decorator
def a_function():
    print "I'm a normal function."

#modified_function = logging_decorator(a_function)

#modified_function()
a_function()
# >> The function I modify has
# been called 1 time(s).
# >> I'm a normal function.

#modified_function()
a_function()
# >> The function I modify has
# been called 2 time(s).
# >> I'm a normal function.
