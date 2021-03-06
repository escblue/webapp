#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�^��[web.sh �S�n1=��0ꡧĭ ��V!�8��y��l3I{fw���L[��v�!��g??[��k�b�'�4ACҙW�8�'Q�:�"Ct[�R�y�^]�-��A.��V�L�6���}�R��;W�`$2�������h"{�6����in�q��Gط��X��~!`{8�!�}��jԎ�����	R~	9��9 �G�n9��i۷F��<x�0��)��U�2�y*C_k������T�w������c78m�;���:������S���{����m�w�i{o�����3L/��ԣ�QxV}��ƻ���8Q[)�?󝖼�J(Q��?}��_�~^�����������l�;�������e��,��G�  