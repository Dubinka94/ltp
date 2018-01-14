#
#    testcases/kernel/syscalls Makefile.
#
#    Copyright (C) 2009, Cisco Systems Inc.
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Ngie Cooper, July 2009
#

top_srcdir		?= ../../..

include	$(top_srcdir)/include/mk/env_pre.mk

ifeq ($(UCLINUX),1)
FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
		   mincore mprotect nftw profil remap_file_pages sbrk
endif

ifeq ($(UCLIBC),1)
FILTER_OUT_DIRS	+= profil
endif

ifeq ($(ANDROID), 1)
FILTER_OUT_DIRS	+= \
	accept4 adjtimex cma confstr fcntl fmtmsg futex getcontext getcpu \
	getdomainname getdtablesize gethostid getgroups get_mempolicy ipc \
	linkat kill mallopt memmap mq_notify mq_open mq_timedreceive \
	mq_timedsend mq_unlink mmap mremap open openat profil ptrace quotactl \
	readahead remap_file_pages rt_sigsuspend rt_sigtimedwait \
	sched_getaffinity sched_setaffinity sendmsg setgroups setns sighold \
	sigrelse sigsuspend sigtimedwait sigwait sigwaitinfo stime \
	setdomainname sethostname symlinkat ulimit ustat vfork vhangup vmsplice
endif

ifeq ($(IOS), 1)
FILTER_OUT_DIRS	+= \
	accept4 adjtimex cma confstr fcntl fmtmsg futex getcontext getcpu \
	getdomainname getdtablesize gethostid getgroups get_mempolicy ipc \
	linkat kill mallopt memmap mq_notify mq_open mq_timedreceive \
	mq_timedsend mq_unlink mmap mremap open openat profil ptrace quotactl \
	readahead remap_file_pages rt_sigsuspend rt_sigtimedwait \
	sched_getaffinity sched_setaffinity sendmsg setgroups setns sighold \
	sigrelse sigsuspend sigtimedwait sigwait sigwaitinfo stime \
	setdomainname sethostname symlinkat ulimit ustat vfork vhangup vmsplice \
	capget capset chmod chown clone fork getcontext llseek \
	mincore mprotect nftw profil remap_file_pages sbrk profil \
	acct access add_key clock_getres clock_nanosleep clock_nanosleep2 \
	epoll_create1 epoll_ctl epoll_pwait epoll_wait exit_group fadvise fallocate \
	fchmod fchown fdatasync flistxattr fstat fstatfs ftruncate getegid geteuid \
	getgid gethostbyname_r getresgid getpid getresuid getrlimit getrusage getsockopt \
	gettid gettimeofday compat_gid getuid ioctl kcmp keyctl lchown lgetxattr link \
	llistxattr lstat memfd_create migrate_pages mknod mknodat mount move_pages \
	nanosleep perf_event_open personality poll ppoll prctl pread preadv pselect \
	pwrite pwritev reboot rename renameat request_key rmdir rt_sigaction rt_sigprocmask \
	sched_getattr sched_getparam sched_getscheduler sched_rr_get_interval sched_setattr \
	sched_setparam sched_setscheduler select setfsgid setfsuid setgid setpriority \
	setregid setresgid setresuid setreuid setrlimit setsockopt settimeofday setuid \
	setxattr sgetmask sigaction sigaltstack sigprocmask socketcall splice \
	statfs swapfile swapoff swapon sync_file_range sysinfo syslog tee timer_gettime \
	timerrdf itimerspec timerfd tk tkill umount umount2 utime utimensat utimes

endif

include $(top_srcdir)/include/mk/generic_trunk_target.mk
