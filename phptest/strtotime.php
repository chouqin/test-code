<?php
date_default_timezone_set('UTC');
//$day = '2012-09-03';
//$day = date('Y-m-d', strtotime('-1 day', strtotime($day1)));
//if ($day == monday)
//$sunday = strtotime(get_monday($day));
//$monday = strtotime(get_sunday($day));
//echo 'sunday is ' . date('Y-m-d G:i:s', $sunday) . "\n";
//echo 'monday is ' . date('Y-m-d G:i:s', $monday) . "\n";
//echo 'this day is ' . date('Y-m-d G:i:s', strtotime($day)) . "\n";
//$sunday = strtotime('Sunday this week', $monday);
//echo 'sunday is ' . date('Y-m-d', $sunday) . "\n";
//echo 'monday is ' . date('Y-m-d', $monday) . "\n";

function get_monday($day)
{
  $time = strtotime($day);
  $day_num = date('w', $time);
  if ($day_num == 0)
  {
    $day_num = 7;
  }
  $time -= ($day_num - 1) * 3600 * 24;
  return date('Y-m-d', $time);
}

function get_sunday($day)
{
  $time = strtotime($day);
  $day_num = date('w', $time);
  if ($day_num == 0)
  {
    $day_num = 7;
  }
  $time += (7 - $day_num) * 3600 * 24;
  return date('Y-m-d', $time);
}

function get_first_day_month($month)
{
  return date("Y-m-d", strtotime("first day of $month"));
}

$month = "2012-01";
$first_day = get_first_day_month($month);
echo "first day of $month is $first_day \n";
