@echo off
chcp 65001
title cmd's
set cmdecho=1
set ztype=0
goto cmd_echo_start
:cmd_start
set cmdtype=n
set /p cmdtype=コマンドを選択(数字を入力):

choice /c 0123
if %errorlevel%==1 set ztype=0
if %errorlevel%==2 set ztype=1
rem _____________________________________________
:cmd_echo_start

if %cmdecho%==1 set cmdtype=1
if %cmdtype%==1 echo 1. arp              ^| arpテーブル&if %ztype%==1 start https://windows.command-ref.com/cmd-arp.html

if %cmdecho%==1 set cmdtype=2
if %cmdtype%==2 echo 2. assoc            ^| 拡張子&if %ztype%==1 start https://windows.command-ref.com/cmd-assoc.html

if %cmdecho%==1 set cmdtype=3
if %cmdtype%==3 echo 3. at               ^| スケジュール win10~=#schtasks&if %ztype%==1 start https://windows.command-ref.com/cmd-at.html

if %cmdecho%==1 set cmdtype=4
if %cmdtype%==4 echo 4. attrib           ^| ファイル属性&if %ztype%==1 start https://windows.command-ref.com/cmd-attrib.html

if %cmdecho%==1 set cmdtype=5
if %cmdtype%==5 echo 5. call             ^| 同時実行でbatプログラムを呼び出す&if %ztype%==1 start https://windows.command-ref.com/cmd-call.html

if %cmdecho%==1 set cmdtype=6
if %cmdtype%==6 echo 6. cd               ^| ディレクトリ移動や表示&if %ztype%==1 start https://windows.command-ref.com/cmd-cd.html

if %cmdecho%==1 set cmdtype=7
if %cmdtype%==7 echo 7. chcp             ^| 文字コード表示や設定&if %ztype%==1 start https://windows.command-ref.com/cmd-chcp.html

if %cmdecho%==1 set cmdtype=8
if %cmdtype%==8 echo 8. chkdsk           ^| ドライブのエラーチェックと修復&if %ztype%==1 start https://windows.command-ref.com/cmd-chkdsk.html

if %cmdecho%==1 set cmdtype=9
if %cmdtype%==9 echo 9. chdir            ^| #cd&if %ztype%==1 start https://windows.command-ref.com/cmd-cd.html

if %cmdecho%==1 set cmdtype=10
if %cmdtype%==10 echo 10.choice          ^| キー入力による選択&if %ztype%==1 start https://windows.command-ref.com/cmd-choice.html

if %cmdecho%==1 set cmdtype=11
if %cmdtype%==11 echo 11.clip            ^| パイプやリダイレクトを用いて格納先のクリップボードを表す&if %ztype%==1 start https://windows.command-ref.com/cmd-clip.html

if %cmdecho%==1 set cmdtype=12
if %cmdtype%==12 echo 12.cls             ^| コンソールをクリア&if %ztype%==1 start https://windows.command-ref.com/cmd-cls.html

if %cmdecho%==1 set cmdtype=13
if %cmdtype%==13 echo 13.cmd             ^| コマンドを起動&if %ztype%==1 start https://windows.command-ref.com/cmd-cmd.html

if %cmdecho%==1 set cmdtype=14
if %cmdtype%==14 echo 14.color           ^| コンソール色&if %ztype%==1 start https://windows.command-ref.com/cmd-color.html

if %cmdecho%==1 set cmdtype=15
if %cmdtype%==15 echo 15.comp            ^| ファイル比較&if %ztype%==1 start https://windows.command-ref.com/cmd-comp.html

if %cmdecho%==1 set cmdtype=16
if %cmdtype%==16 echo 16.compact         ^| NTFS形式で圧縮や解凍&if %ztype%==1 start https://windows.command-ref.com/cmd-compact.html

if %cmdecho%==1 set cmdtype=17
if %cmdtype%==17 echo 17.convert         ^| FATからNTFSに変更&if %ztype%==1 start https://windows.command-ref.com/cmd-convert.html

if %cmdecho%==1 set cmdtype=18
if %cmdtype%==18 echo 18.copy            ^| ファイルをコピー&if %ztype%==1 start https://windows.command-ref.com/cmd-copy.html

if %cmdecho%==1 set cmdtype=19
if %cmdtype%==19 echo 19.cscript         ^| スクリプトファイルを実行&if %ztype%==1 start https://windows.command-ref.com/cmd-cscript.html

if %cmdecho%==1 set cmdtype=20
if %cmdtype%==20 echo 20.curl            ^| サーバーへリクエストを送ったりレスポンスを確認&if %ztype%==1 start https://windows.command-ref.com/cmd-curl.html

if %cmdecho%==1 set cmdtype=21
if %cmdtype%==21 echo 21.date            ^| 日付の表示や設定&if %ztype%==1 start https://windows.command-ref.com/cmd-date.html

if %cmdecho%==1 set cmdtype=22
if %cmdtype%==22 echo 22.del             ^| ファイルを削除&if %ztype%==1 start https://windows.command-ref.com/cmd-del.html

if %cmdecho%==1 set cmdtype=23
if %cmdtype%==23 echo 23.dir             ^| ファイルやディレクトリを一覧表示&if %ztype%==1 start https://windows.command-ref.com/cmd-dir.html

if %cmdecho%==1 set cmdtype=24
if %cmdtype%==24 echo 24.doskey          ^| コマンドにマクロを設定&if %ztype%==1 start https://windows.command-ref.com/cmd-doskey.html

if %cmdecho%==1 set cmdtype=25
if %cmdtype%==25 echo 25.echo            ^| メッセージの表示やプロンプト表示と非表示&if %ztype%==1 start https://windows.command-ref.com/cmd-echo.html

if %cmdecho%==1 set cmdtype=26
if %cmdtype%==26 echo 26.endlocal        ^| バッチファイルで環境変数のローカル化を終了&if %ztype%==1 start https://windows.command-ref.com/cmd-endlocal.html

if %cmdecho%==1 set cmdtype=27
if %cmdtype%==27 echo 27.eventcreate     ^| イベントログを表示&if %ztype%==1 start https://windows.command-ref.com/cmd-eventcreate.html

if %cmdecho%==1 set cmdtype=28
if %cmdtype%==28 echo 28.expand          ^| cap形式の圧縮ファイルを解凍&if %ztype%==1 start https://windows.command-ref.com/cmd-expand.html

if %cmdecho%==1 set cmdtype=29
if %cmdtype%==29 echo 29.erase           ^| #del&if %ztype%==1 start https://windows.command-ref.com/cmd-del.html

if %cmdecho%==1 set cmdtype=30
if %cmdtype%==30 echo 30.exit            ^| コンソールを終了&if %ztype%==1 start https://windows.command-ref.com/cmd-exit.html

if %cmdecho%==1 set cmdtype=31
if %cmdtype%==31 echo 31.fc              ^| ファイル比較&if %ztype%==1 start https://windows.command-ref.com/cmd-fc.html

if %cmdecho%==1 set cmdtype=32
if %cmdtype%==32 echo 32.find            ^| テキストファイルの中身を検索&if %ztype%==1 start https://windows.command-ref.com/cmd-find.html

if %cmdecho%==1 set cmdtype=33
if %cmdtype%==33 echo 33.findstr         ^| テキストファイルから文字列を検索&if %ztype%==1 start https://windows.command-ref.com/cmd-findstr.html

if %cmdecho%==1 set cmdtype=34
if %cmdtype%==34 echo 34.for             ^| ループ処理&if %ztype%==1 start https://windows.command-ref.com/cmd-for.html

if %cmdecho%==1 set cmdtype=35
if %cmdtype%==35 echo 35.forfiles        ^| 条件に合致するファイルに対して処理を行う&if %ztype%==1 start https://windows.command-ref.com/cmd-forfiles.html

if %cmdecho%==1 set cmdtype=36
if %cmdtype%==36 echo 36.format          ^| ディスクをフォーマット&if %ztype%==1 start https://windows.command-ref.com/cmd-format.html

if %cmdecho%==1 set cmdtype=37
if %cmdtype%==37 echo 37.fsutil *        ^| NTFSファイルシステムに関する操作&if %ztype%==1 start https://windows.command-ref.com/cmd-fsutil.html

if %cmdecho%==1 set cmdtype=38
if %cmdtype%==38 echo 38.ftp             ^| FTPサーバーに接続してファイルの送受信を行う&if %ztype%==1 start https://windows.command-ref.com/cmd-ftp.html

if %cmdecho%==1 set cmdtype=39
if %cmdtype%==39 echo 39.ftype           ^| ファイルタイプと実行するコマンドの関連付けの表示と設定&if %ztype%==1 start https://windows.command-ref.com/cmd-ftype.html

if %cmdecho%==1 set cmdtype=40
if %cmdtype%==40 echo 40.getmac          ^| macアドレスを表示&if %ztype%==1 start https://windows.command-ref.com/cmd-getmac.html

if %cmdecho%==1 set cmdtype=41
if %cmdtype%==41 echo 41.goto            ^| バッチプログラム内のラベルへ処理を移す&if %ztype%==1 start https://windows.command-ref.com/cmd-goto.html

if %cmdecho%==1 set cmdtype=42
if %cmdtype%==42 echo 42.gpresult        ^| ポリシーの結果セットを表示&if %ztype%==1 start https://windows.command-ref.com/cmd-gpresult.html

if %cmdecho%==1 set cmdtype=43
if %cmdtype%==43 echo 43.help            ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-help.html

if %cmdecho%==1 set cmdtype=44
if %cmdtype%==44 echo 44.hostname        ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-hostname.html

if %cmdecho%==1 set cmdtype=45
if %cmdtype%==45 echo 45.if              ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-if.html

if %cmdecho%==1 set cmdtype=46
if %cmdtype%==46 echo 46.ipconfig        ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-ipconfig.html

if %cmdecho%==1 set cmdtype=47
if %cmdtype%==47 echo 47.label           ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-label.html

if %cmdecho%==1 set cmdtype=48
if %cmdtype%==48 echo 48.makecab         ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-makecab.html

if %cmdecho%==1 set cmdtype=49
if %cmdtype%==49 echo 49.md              ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-md.html

if %cmdecho%==1 set cmdtype=50
if %cmdtype%==50 echo 50.mkdir           ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-md.html

if %cmdecho%==1 set cmdtype=51
if %cmdtype%==51 echo 51.mklink          ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-mklink.html

if %cmdecho%==1 set cmdtype=52
if %cmdtype%==52 echo 52.more            ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-more.html

if %cmdecho%==1 set cmdtype=53
if %cmdtype%==53 echo 53.move            ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-move.html

if %cmdecho%==1 set cmdtype=54
if %cmdtype%==54 echo 54.nbtstat         ^| &if %ztype%==1 start https://windows.command-ref.com/cmd-nbtstat.html

if %cmdecho%==1 set cmdtype=55
if %cmdtype%==55 echo 55.net * &if %ztype%==1 start https://windows.command-ref.com/cmd-net.html

if %cmdecho%==1 set cmdtype=56
if %cmdtype%==56 echo 56.netstat &if %ztype%==1 start https://windows.command-ref.com/cmd-netstat.html

if %cmdecho%==1 set cmdtype=57
if %cmdtype%==57 echo 57.nslookup &if %ztype%==1 start https://windows.command-ref.com/cmd-nslookup.html

if %cmdecho%==1 set cmdtype=58
if %cmdtype%==58 echo 58.openfiles * &if %ztype%==1 start https://windows.command-ref.com/cmd-openfiles.html

if %cmdecho%==1 set cmdtype=59
if %cmdtype%==59 echo 59.path &if %ztype%==1 start https://windows.command-ref.com/cmd-path.html

if %cmdecho%==1 set cmdtype=60
if %cmdtype%==60 echo 60.pathping &if %ztype%==1 start https://windows.command-ref.com/cmd-pathping.html

if %cmdecho%==1 set cmdtype=61
if %cmdtype%==61 echo 61.pause &if %ztype%==1 start https://windows.command-ref.com/cmd-pause.html

if %cmdecho%==1 set cmdtype=62
if %cmdtype%==62 echo 62.ping &if %ztype%==1 start https://windows.command-ref.com/cmd-ping.html

if %cmdecho%==1 set cmdtype=63
if %cmdtype%==63 echo 63.popd &if %ztype%==1 start https://windows.command-ref.com/cmd-popd.html

if %cmdecho%==1 set cmdtype=64
if %cmdtype%==64 echo 64.prompt &if %ztype%==1 start https://windows.command-ref.com/cmd-prompt.html

if %cmdecho%==1 set cmdtype=65
if %cmdtype%==65 echo 65.pushd &if %ztype%==1 start https://windows.command-ref.com/cmd-pushd.html

if %cmdecho%==1 set cmdtype=66
if %cmdtype%==66 echo 66.rd &if %ztype%==1 start https://windows.command-ref.com/cmd-rd.html

if %cmdecho%==1 set cmdtype=67
if %cmdtype%==67 echo 67.reg * &if %ztype%==1 start https://windows.command-ref.com/cmd-reg.html

if %cmdecho%==1 set cmdtype=68
if %cmdtype%==68 echo 68.rem &if %ztype%==1 start https://windows.command-ref.com/cmd-rem.html

if %cmdecho%==1 set cmdtype=69
if %cmdtype%==69 echo 69.ren &if %ztype%==1 start https://windows.command-ref.com/cmd-ren.html

if %cmdecho%==1 set cmdtype=70
if %cmdtype%==70 echo 70.rename &if %ztype%==1 start https://windows.command-ref.com/cmd-rem.html

if %cmdecho%==1 set cmdtype=71
if %cmdtype%==71 echo 71.replace &if %ztype%==1 start https://windows.command-ref.com/cmd-replace.html

if %cmdecho%==1 set cmdtype=72
if %cmdtype%==72 echo 72.rmdir &if %ztype%==1 start https://windows.command-ref.com/cmd-rd.html

if %cmdecho%==1 set cmdtype=73
if %cmdtype%==73 echo 73.robocopy &if %ztype%==1 start https://windows.command-ref.com/cmd-robocopy.html

if %cmdecho%==1 set cmdtype=74
if %cmdtype%==74 echo 74.route &if %ztype%==1 start https://windows.command-ref.com/cmd-route.html

if %cmdecho%==1 set cmdtype=75
if %cmdtype%==75 echo 75.runas &if %ztype%==1 start https://windows.command-ref.com/cmd-runas.html

if %cmdecho%==1 set cmdtype=76
if %cmdtype%==76 echo 76.sc * &if %ztype%==1 start https://windows.command-ref.com/cmd-sc.html

if %cmdecho%==1 set cmdtype=77
if %cmdtype%==77 echo 77.schtasks * &if %ztype%==1 start https://windows.command-ref.com/cmd-schtasks.html

if %cmdecho%==1 set cmdtype=78
if %cmdtype%==78 echo 78.set &if %ztype%==1 start https://windows.command-ref.com/cmd-set.html

if %cmdecho%==1 set cmdtype=79
if %cmdtype%==79 echo 79.setx &if %ztype%==1 start https://windows.command-ref.com/cmd-setlocal.html

if %cmdecho%==1 set cmdtype=80
if %cmdtype%==80 echo 80.setlocal &if %ztype%==1 start https://windows.command-ref.com/cmd-setlocal.html

if %cmdecho%==1 set cmdtype=81
if %cmdtype%==81 echo 81.shift &if %ztype%==1 start https://windows.command-ref.com/cmd-shift.html

if %cmdecho%==1 set cmdtype=82
if %cmdtype%==82 echo 82.shutdown &if %ztype%==1 start https://windows.command-ref.com/cmd-shutdown.html

if %cmdecho%==1 set cmdtype=83
if %cmdtype%==83 echo 83.sort &if %ztype%==1 start https://windows.command-ref.com/cmd-sort.html

if %cmdecho%==1 set cmdtype=84
if %cmdtype%==84 echo 84.start &if %ztype%==1 start https://windows.command-ref.com/cmd-start.html

if %cmdecho%==1 set cmdtype=85
if %cmdtype%==85 echo 85.subst &if %ztype%==1 start https://windows.command-ref.com/cmd-subst.html

if %cmdecho%==1 set cmdtype=86
if %cmdtype%==86 echo 86.systeminfo &if %ztype%==1 start https://windows.command-ref.com/cmd-systeminfo.html

if %cmdecho%==1 set cmdtype=87
if %cmdtype%==87 echo 87.taskkill &if %ztype%==1 start https://windows.command-ref.com/cmd-taskkill.html

if %cmdecho%==1 set cmdtype=88
if %cmdtype%==88 echo 88.tasklist &if %ztype%==1 start https://windows.command-ref.com/cmd-tasklist.html

if %cmdecho%==1 set cmdtype=89
if %cmdtype%==89 echo 89.time &if %ztype%==1 start https://windows.command-ref.com/cmd-time.html

if %cmdecho%==1 set cmdtype=90
if %cmdtype%==90 echo 90.timeout &if %ztype%==1 start https://windows.command-ref.com/cmd-timeout.html

if %cmdecho%==1 set cmdtype=91
if %cmdtype%==91 echo 91.title &if %ztype%==1 start https://windows.command-ref.com/cmd-title.html

if %cmdecho%==1 set cmdtype=92
if %cmdtype%==92 echo 92.tracert &if %ztype%==1 start https://windows.command-ref.com/cmd-tracert.html

if %cmdecho%==1 set cmdtype=93
if %cmdtype%==93 echo 93.tree &if %ztype%==1 start https://windows.command-ref.com/cmd-tree.html

if %cmdecho%==1 set cmdtype=94
if %cmdtype%==94 echo 94.type &if %ztype%==1 start https://windows.command-ref.com/cmd-type.html

if %cmdecho%==1 set cmdtype=95
if %cmdtype%==95 echo 95.ver &if %ztype%==1 start https://windows.command-ref.com/cmd-ver.html

if %cmdecho%==1 set cmdtype=96
if %cmdtype%==96 echo 96.vol &if %ztype%==1 start https://windows.command-ref.com/cmd-vol.html

if %cmdecho%==1 set cmdtype=97
if %cmdtype%==97 echo 97.where &if %ztype%==1 start https://windows.command-ref.com/cmd-where.html

if %cmdecho%==1 set cmdtype=98
if %cmdtype%==98 echo 98.whoami &if %ztype%==1 start https://windows.command-ref.com/cmd-whoami.html

if %cmdecho%==1 set cmdtype=99
if %cmdtype%==99 echo 99.xcopy &if %ztype%==1 start https://windows.command-ref.com/cmd-xcopy.html

rem _____________________________________________
set cmdecho=0
goto cmd_start
