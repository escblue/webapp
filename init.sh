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
�N��[init.sh �S�n�0=O_����$�؆���С���fl'�$�����';�m�b;X��H�z�x='(Z�] 7����n=:���� ��k�BJ�!��(����2�B,��S���9���κ�͕]�&D�j���T4��cM�=�����@^1Uڴ����ǐ��^�Җ(m�ڇ��=1\j )�����g����Y�+��\O�JO��IL�ȭ�ڔBb�Mo��m�#���._p��+��~�4���bl�`���6BP����nX�gcn�1��3LE-|z��z׹���b�ʨa�:���w��H��Сǚ��qc��r	���&�iA�/�Bِ�f��6����(�aL`���8������N���p�g�@
�ԠRʹ>���R|0Ko�)n�p�T�kM��<+���{�l  