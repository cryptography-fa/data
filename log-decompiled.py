# uncompyle6 version 3.3.4
# Python bytecode 2.7
# Decompiled from: Python 2.7.16 (default, Apr 24 2019, 10:05:31) 
# [GCC 4.2.1 Compatible Android (5058415 based on r339409) Clang 8.0.2 (https://a
# Embedded file name: <febry>
import os, sys
print '\x1b[1;32mSilahkan Masukkan Username & Password Anda'
print '\x1b[1;32matau silahkan Hubungi 081269xxxxxx '
username = 'sw4llow'
password = 'Jom123'

def restart():
    ngulang = sys.executable
    os.execl(ngulang, ngulang, *sys.argv)


def main():
    uname = raw_input('username : ')
    if uname == username:
        pwd = raw_input('password : ')
        if pwd == password:
            print '\x1b[1;32mSelamat Menggunakan Tools ini...',
            print ''
            print 'Jangan Di Salah Gunakan....',
            sys.exit()
        else:
            print '\x1b[1;32mMaaf Masukkan password Anda salah... [?]\x1b[00m'
            print 'Silahkan segera log-in kembali...!!\n'
            restart()
    else:
        print '\x1b[1;32mMaaf Masukkan Username Anda salah... [?]\x1b[00m'
        print 'Silahkan segera log-in kembali...!!\n'
        restart()


try:
    main()
except KeyboardInterrupt:
    os.system('clear')
    restart()