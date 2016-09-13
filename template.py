#!/usr/bin/python

''' 
    Template for competitive programming
    C++ 4.9
'''

import argparse
import sys
import datetime

PLATFORM = 'codechef'

parser = argparse.ArgumentParser()
parser.add_argument('filename', type=str, nargs='?', default='test')
feature_parser = parser.add_mutually_exclusive_group(required=False)
feature_parser.add_argument('-a', '--algo', dest='algo', action='store_true')
feature_parser.add_argument('-n', '--no-algo', dest='algo', action='store_false')
feature_parser.set_defaults(algo=False)

args = parser.parse_args()
is_algo = args.algo

name=args.filename.lower()
filename=name+'.cpp'
f1=open(filename,'w')
now=datetime.datetime.now()
time = now.strftime("%Y-%m-%d %H:%M")

prog_string='''
/*
Problem : {problem}
Time    : {time}
Platform: {platform}
*/
#include <bits/stdc++.h>
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
using namespace std;

typedef long long int ll;

#define FOR(i,n) for(int i = 0; i < n; i++)
#define FORS(i,a,n) for(int i = a; i < n; i++)
#define RDARR(a,n) FOR(i,n) cin>>a[i];
#define SOLVE() int t;cin>>t;FOR(tc,t) solve();
#define PB push_back
#define TRACEARR(a,n) FOR(i,n) cout<<a[i]<<" ";


void solve(){{
}}

int main(){{ _

    //SOLVE()
    solve();
    return 0;
}}'''.format(time=time, problem=name.upper(), platform=PLATFORM)

algo_string='''
/*
    *
    *
    * at {time}
*/
#include <bits/stdc++.h>
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
using namespace std;

typedef long long int ll;

#define FOR(i,n) for(int i = 0; i < n; i++)
#define FORS(i,a,n) for(int i = a; i < n; i++)
#define RDARR(a,n) FOR(i,n) cin>>a[i];
#define SOLVE() int t;cin>>t;FOR(tc,t) solve();
#define PB push_back
#define TRACEARR(a,n) FOR(i,n) cout<<a[i]<<" ";

int main(){{ _

    return 0;
}}'''.format(time=time)

if is_algo:
    string = algo_string
else:
    string = prog_string

f1.write(string)
f1.close()
