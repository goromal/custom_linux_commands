#!/usr/bin/python

import sys

def hh_mm_ss_to_secs(hh, mm, ss):
    return 3600*hh + 60*mm + ss

def secs_to_hh_mm_ss(secs):
    hh = int(secs / 3600)
    secs -= hh * 3600
    mm = int(secs / 60)
    secs -= mm * 60
    ss = secs
    return hh, mm, ss

def hh_mm_ss_from_str(hhmmss_str):
    hhmmss_str_list = hhmmss_str.split(':')
    if len(hhmmss_str_list) == 2:
        return 0, int(hhmmss_str_list[0]), float(hhmmss_str_list[1])
    else:
        return int(hhmmss_str_list[0]), int(hhmmss_str_list[1]), float(hhmmss_str_list[2])

def str_from_hh_mm_ss(hh, mm, ss):
    return "{0:02}:{1:02}:{2:04.1f}".format(hh, mm, ss)

def print_duration_from_time_endpoint_strings(hhmmss_i_str, hhmmss_f_str):
    hh_i, mm_i, ss_i = hh_mm_ss_from_str(hhmmss_i_str)
    hh_f, mm_f, ss_f = hh_mm_ss_from_str(hhmmss_f_str)
    secs_i = hh_mm_ss_to_secs(hh_i, mm_i, ss_i)
    secs_f = hh_mm_ss_to_secs(hh_f, mm_f, ss_f)
    hh_d, mm_d, ss_d = secs_to_hh_mm_ss(secs_f - secs_i)
    print(str_from_hh_mm_ss(hh_d, mm_d, ss_d))

def print_time_from_string(hhmmss_str):
    hh, mm, ss = hh_mm_ss_from_str(hhmmss_str)
    print(str_from_hh_mm_ss(hh, mm, ss))

if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] == "duration-from-endpoints":
            hhmmss_i_str = sys.argv[2]
            hhmmss_f_str = sys.argv[3]
            print_duration_from_time_endpoint_strings(hhmmss_i_str, hhmmss_f_str)
        if sys.argv[1] == "fix-time-format":
            hhmmss_str = sys.argv[2]
            print_time_from_string(hhmmss_str)
