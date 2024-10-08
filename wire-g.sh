#!/bin/sh
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'wire-g.sh' encrypted at Tue May 28 11:08:29 PM UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY!IY� b_��������������   � `]�Ú�	��j-I���f�����
x$�BOF�h�Se2yI��
z�D�2���z�&�(�hS�I��           �&$�ʍ244j  � P � $$SBM�����i��h��Q�4SA�4�=@4z�M q����4@ h h@  0�!di��&A=F�hډ��6��A�z��� ��12l�������>�7�In��s;��']�)W�L�q��f���z��N�ɇ��8�Z����1��2z	B�Qޟː�Z$
K��ΘRB�Lǈ���B��Uΐ0�Pg�k�Nk�[�2��_D�6;tf7��V_��w�Y��Ԁ��m�q�/4�$Q� ��4 >��F����#ʢ�`Ff���޸�Se��+>C#���P�~4���v�l�lu��@>xni�p
�f��f<����j�5�(v~=5~�
#�q��%=xk���L"�ى�#�t��%��@�fUM�&Rڦ�y6" o�d�N�5�)Pd �ew�Lz<�C�Z��+I8$�ʝ4("�;{V��n�9�8H����=dk�6��H�^�_e�o瞼y�@�ȥO�	��I����u�yܯe���c�r��_f�j�JI<�^a�X��އYM��b-j��r,�U�����
������}7[���=��"�<V��+4�p�wO4.v�0=�_����R�FVjj�+6?�{e�V��[x�_��a�%g&u�(&�Jn0g��E�`���Y��|{���`d<k����\d�B�C-��ޒ-�#A�1���]�f��޹~�ϋT�ѝ�֙Ӊd�f���5.�,"�[�/��^�f�4FT��1Z"(n�TEp�6)ǿ,��&�y��g�S�E��~La�e`_a54RF���d	��1��K���&�ei��P<%(���8�xp���w���6����4Kd%�&1�D�9�{_��q��h�����,0��2�o�guPDh<L��k����w+*��5M��`3�ϑ�L8�bx��\�9��	L<#>���{�Mh����U�/��l���v��l��;V�}�����Ă��4�����Ǵ\W{)C3<����9�v�>'�t���mp�zOI�AY�qf�~�+ZޣĠ�0��u	�
D/��l�|�R��>��$u05i�3þz	�
���dc��VY�0XAi���K�u�XmZ��aQ�^{�%X�����E7-���t,�n���l�=U�9($ny��n%CI��J��꒪nM&{ٶ ��B��� H�)����gHɤ7�	��*�iP1��Vifr�-����Aʨ��B!M@��p�� �O�!D�A�1�Y7��C8�f���P7�9�Ϭ-���-�4���*;�� s�
+Al��0���������� V�P��ba��Xݛ]���ż@{O�@�m�?�\�"7@wv��y�|n)Հ4�_��Z@4�lv��czf�������^�X����;4�tv�ڕF�d)�f���� �U��	\�^�
'&]�?��c��f��+@l�0����w�y9h��;>:BWxG�޷�+CIU��氫��÷�E�i���n75�����L��S����x�UF<v���0�q���\F�wX�W���>�ͻ���V=8{N �� �09
�^~����`>�p���1�Q���Uo��zk�b�\,^�X揉��}�FnǟåE��e��s7��#�^ꎣ�ɟF>�Tv�p���[ �bC��IM�<+!�[���U�Ծ����� ��QI`���!*��9i�]�f^���W��{� �_f��GWJ��?����-8����1�Pl��ZKIF�P`ɒ6�C� �Jj���6��4�����S����16�?P����������a5�
࠶=�~iPv�[�@�t GD�LF<}����u��]�)�r�kJ0%R�p����:zoA��n�'ԑ�+L���M~��e�+�Kb`9����)_>L�W�CK�4���F6��m�����A�s"4uW$�X8����8��\q1$Q	�K$�KB<� �ѡ�W�
ۏ<�lձ�?ʔ�X�rZB��3A[H���B�F�����̼������P��{
v�aiX㥿N��I� �kS�U��6�D�:�\�:���D*Ȩ މ���l�{�����G��/�gbFA�VD���Kru�L�:���H)Ÿ�c�%�u��X��4.QjġEҒ!�&���%�=�R�6&hC���cZlJ��J�:���
/��J�������NR!4��<�vdv�Y�:c�%Tl61�H�M!���8z��������6&�S\�AšC��A����L�( Ÿh&@^c�~�Ib��̀BL7> 4��Z�K�y%wO��RFK�y$Gm�$0c;�hA��}I3U�.ьhm�a�k���6�ƽ�Ձ�Ǡ�n�#� pE�e8�[_v f�v���iv2�
[#"���B����/O[OCv�۵Օ6IBd�3����-�Ҁ₡XT�h�y��4�H��LQ/X�d '̌�֑]y��,��IH�s��b�������NJ ����u���1DJ�� �����eF5��9�Ld ��Y��	y�Zm]p�1F�°􈱖[0�!��5[�9�L����Lc+HV�!��Y���H�/���JƖ����J�`&��!Kv�X���.{(5*�A����M�JD���M��Wz$���P�g˶r��~}c�X�Z$�_R`@H H�	�   D-(ag�8���
<h`���� (b���{ڳ�X#i	{u^�%��-�n1�6��G��a�2�`<u�
b���u�0
��Rs��>W�i�d����,�66�p�����e�Q�J�	ȴ<�肤\� �cHbI0M �V���a5;{�zW��`�z<�� v�yQ� ��Uh��H@��e\*!���iJlAc �*(��b�-�v��"�&z�[U,+B�sIy�6kIj��)Q)�\����4�.�8���%]j�(�F������KB��d먯������� 
�ѓIQ&!b�f�����ȃERIC�):^y`,�S�I� �8�h�X���)�SG�p{0K�Fd��`�)︔�Ϲx΀*��.�o�3ܚ	oYE��wleU_�jǁ�x�������FLx1�G,<�L�����RC2�wKfu�� ���[h�X�J��.��J��'�&.��i 3f80А��:�	YQW���TJ@k���Cf-|�cV���	�ВZE�RĴk��aj64�e� ��ď#w$R���&$C@Z�F�	��G��^jh$�G��l�%l[؀�KHl ;5Ld@�Z��&F\ap��00 �t�d��ČO���!rW�w��wj!N���'��*�BY��������T��&�,��!�G�-d���-��(/����4�|�7;x@"8}�'��Ѝ�\��7;�e�A[���HC`�@�C1��}��j���-�WUt�	)�i!w0�~x
����48�H�z��|ܲ!���J^	�%
*ȸ�)N!���_���)�
J�(