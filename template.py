#!/usr/bin/python

''' 
    Template for competitive programming
    C++ 4.9
'''


import sys
import datetime

PLATFORM = 'codechef'

if len(sys.argv) == 2:
    name=sys.argv[1].lower()
else:
    name='test'
filename=name+'.cpp'
f1=open(filename,'w')
now=datetime.datetime.now()
time = now.strftime("%Y-%m-%d %H:%M")

string='''
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
f1.write(string)
f1.close()
