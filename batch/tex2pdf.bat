echo on

echo ".xbbファイルの作成"
extractbb %~p1fig\*.jpg
extractbb %~p1fig\*.png
extractbb %~p1fig\*.bmp
extractbb %~p1fig\*.eps

platex -synctex=1 -jobname="%~n1" --kanji=utf8 "%1"

echo "目次図表のラベリングのために2回処理します☆"
platex -synctex=1 -jobname="%~n1" --kanji=utf8 "%1" && dvipdfmx  -f msembed.map "%~n1"

echo "不要ファイルの削除"
del %~n1.log
del %~n1.dvi
del %~n1.synctex.gz
del %~n1.aux
del %~p1fig\*.xbb

echo "start %~n1.pdf"
start %~n1.pdf