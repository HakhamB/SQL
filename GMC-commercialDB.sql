PGDMP                      |            GMC-commercialDB    16.3    16.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    295285    GMC-commercialDB    DATABASE     �   CREATE DATABASE "GMC-commercialDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 "   DROP DATABASE "GMC-commercialDB";
                postgres    false            �            1259    295286 
   CATEGORIES    TABLE     �   CREATE TABLE public."CATEGORIES" (
    "CATEGORY_CODE" numeric(6,0) NOT NULL,
    "CATEGORY_NAME" character varying(25) NOT NULL,
    "DESCRIPTION" character varying(100) NOT NULL
);
     DROP TABLE public."CATEGORIES";
       public         heap    postgres    false            �            1259    295291 	   CUSTOMERS    TABLE     �  CREATE TABLE public."CUSTOMERS" (
    "CUSTOMER_CODE" character(5) NOT NULL,
    "COMPANY" character varying(40) NOT NULL,
    "ADDRESS" character varying(60) NOT NULL,
    "CITY" character varying(30) NOT NULL,
    "POSTAL_CODE" character varying(10) NOT NULL,
    "COUNTRY" character varying(15) NOT NULL,
    "PHONE" character varying(24) NOT NULL,
    "FAX" character varying(24) NOT NULL
);
    DROP TABLE public."CUSTOMERS";
       public         heap    postgres    false            �            1259    295309 	   EMPLOYEES    TABLE     �  CREATE TABLE public."EMPLOYEES" (
    "EMPLOYEE_NUMBER" numeric(6,0) NOT NULL,
    "REPORTS_TO" numeric(6,0),
    "LAST_NAME" character varying(40) NOT NULL,
    "FIRST_NAME" character varying(30) NOT NULL,
    "POSITIONS" character varying(30) NOT NULL,
    "TITLE" character varying(5) NOT NULL,
    "BIRTH_DATE" date NOT NULL,
    "HIRE_DATE" date DEFAULT CURRENT_DATE NOT NULL,
    "SALARY" numeric(8,2) NOT NULL,
    "COMMISSION" numeric(8,2)
);
    DROP TABLE public."EMPLOYEES";
       public         heap    postgres    false            �            1259    295296    ORDERS    TABLE     �   CREATE TABLE public."ORDERS" (
    "ORDER_NUMBER" numeric(6,0) NOT NULL,
    "CUSTOMER_CODE" character(5) NOT NULL,
    "EMPLOYEE_NUMBER" numeric(6,0) NOT NULL,
    "ORDER_DATE" date NOT NULL,
    "SHIP_DATE" date,
    "SHIPPING_COST" numeric(8,2)
);
    DROP TABLE public."ORDERS";
       public         heap    postgres    false            �            1259    295301    ORDER_DETAILS    TABLE     �   CREATE TABLE public."ORDER_DETAILS" (
    "ORDER_NUMBER" numeric(6,0) NOT NULL,
    "PRODUCT_REF" numeric(6,0) NOT NULL,
    "UNIT_PRICE" numeric(8,2) NOT NULL,
    "QUANTITY" numeric(5,0) NOT NULL,
    "DISCOUNT" real NOT NULL
);
 #   DROP TABLE public."ORDER_DETAILS";
       public         heap    postgres    false            �            1259    295319    PRODUCTS    TABLE     �  CREATE TABLE public."PRODUCTS" (
    "PRODUCT_REF" numeric(6,0) NOT NULL,
    "PRODUCT_NAME" character varying(40) NOT NULL,
    "SUPPLIER_NUMBER" numeric(6,0) NOT NULL,
    "CATEGORY_CODE" numeric(6,0) NOT NULL,
    "QUANTITY" character varying(30),
    "UNIT_PRICE" numeric(8,2) NOT NULL,
    "UNITS_IN_STOCK" numeric(5,0),
    "UNITS_ON_ORDER" numeric(5,0),
    "UNAVAILABLE" numeric(1,0)
);
    DROP TABLE public."PRODUCTS";
       public         heap    postgres    false            �            1259    295314 	   SUPPLIERS    TABLE     �  CREATE TABLE public."SUPPLIERS" (
    "SUPPLIER_NUMBER" numeric(6,0) NOT NULL,
    "COMPANY" character varying(40) NOT NULL,
    "ADDRESS" character varying(60) NOT NULL,
    "CITY" character varying(30) NOT NULL,
    "POSTAL_CODE" character varying(10) NOT NULL,
    "COUNTRY" character varying(15) NOT NULL,
    "PHONE" character varying(24) NOT NULL,
    "FAX" character varying(24) NOT NULL
);
    DROP TABLE public."SUPPLIERS";
       public         heap    postgres    false                      0    295286 
   CATEGORIES 
   TABLE DATA           W   COPY public."CATEGORIES" ("CATEGORY_CODE", "CATEGORY_NAME", "DESCRIPTION") FROM stdin;
    public          postgres    false    215   (-                 0    295291 	   CUSTOMERS 
   TABLE DATA           ~   COPY public."CUSTOMERS" ("CUSTOMER_CODE", "COMPANY", "ADDRESS", "CITY", "POSTAL_CODE", "COUNTRY", "PHONE", "FAX") FROM stdin;
    public          postgres    false    216   ".                 0    295309 	   EMPLOYEES 
   TABLE DATA           �   COPY public."EMPLOYEES" ("EMPLOYEE_NUMBER", "REPORTS_TO", "LAST_NAME", "FIRST_NAME", "POSITIONS", "TITLE", "BIRTH_DATE", "HIRE_DATE", "SALARY", "COMMISSION") FROM stdin;
    public          postgres    false    219   �@                 0    295296    ORDERS 
   TABLE DATA           �   COPY public."ORDERS" ("ORDER_NUMBER", "CUSTOMER_CODE", "EMPLOYEE_NUMBER", "ORDER_DATE", "SHIP_DATE", "SHIPPING_COST") FROM stdin;
    public          postgres    false    217   =B                 0    295301    ORDER_DETAILS 
   TABLE DATA           n   COPY public."ORDER_DETAILS" ("ORDER_NUMBER", "PRODUCT_REF", "UNIT_PRICE", "QUANTITY", "DISCOUNT") FROM stdin;
    public          postgres    false    218   �k                 0    295319    PRODUCTS 
   TABLE DATA           �   COPY public."PRODUCTS" ("PRODUCT_REF", "PRODUCT_NAME", "SUPPLIER_NUMBER", "CATEGORY_CODE", "QUANTITY", "UNIT_PRICE", "UNITS_IN_STOCK", "UNITS_ON_ORDER", "UNAVAILABLE") FROM stdin;
    public          postgres    false    221   (�                 0    295314 	   SUPPLIERS 
   TABLE DATA           �   COPY public."SUPPLIERS" ("SUPPLIER_NUMBER", "COMPANY", "ADDRESS", "CITY", "POSTAL_CODE", "COUNTRY", "PHONE", "FAX") FROM stdin;
    public          postgres    false    220   �       i           2606    295290    CATEGORIES CATEGORIES_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."CATEGORIES"
    ADD CONSTRAINT "CATEGORIES_pkey" PRIMARY KEY ("CATEGORY_CODE");
 H   ALTER TABLE ONLY public."CATEGORIES" DROP CONSTRAINT "CATEGORIES_pkey";
       public            postgres    false    215            k           2606    295295    CUSTOMERS CUSTOMERS_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."CUSTOMERS"
    ADD CONSTRAINT "CUSTOMERS_pkey" PRIMARY KEY ("CUSTOMER_CODE");
 F   ALTER TABLE ONLY public."CUSTOMERS" DROP CONSTRAINT "CUSTOMERS_pkey";
       public            postgres    false    216            q           2606    295313    EMPLOYEES EMPLOYEES_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."EMPLOYEES"
    ADD CONSTRAINT "EMPLOYEES_pkey" PRIMARY KEY ("EMPLOYEE_NUMBER");
 F   ALTER TABLE ONLY public."EMPLOYEES" DROP CONSTRAINT "EMPLOYEES_pkey";
       public            postgres    false    219            m           2606    295300    ORDERS ORDERS_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ORDERS"
    ADD CONSTRAINT "ORDERS_pkey" PRIMARY KEY ("ORDER_NUMBER");
 @   ALTER TABLE ONLY public."ORDERS" DROP CONSTRAINT "ORDERS_pkey";
       public            postgres    false    217            o           2606    295305     ORDER_DETAILS ORDER_DETAILS_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."ORDER_DETAILS"
    ADD CONSTRAINT "ORDER_DETAILS_pkey" PRIMARY KEY ("PRODUCT_REF", "ORDER_NUMBER");
 N   ALTER TABLE ONLY public."ORDER_DETAILS" DROP CONSTRAINT "ORDER_DETAILS_pkey";
       public            postgres    false    218    218            u           2606    295323    PRODUCTS PRODUCTS_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("PRODUCT_REF");
 D   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_pkey";
       public            postgres    false    221            s           2606    295318    SUPPLIERS SUPPLIERS_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."SUPPLIERS"
    ADD CONSTRAINT "SUPPLIERS_pkey" PRIMARY KEY ("SUPPLIER_NUMBER");
 F   ALTER TABLE ONLY public."SUPPLIERS" DROP CONSTRAINT "SUPPLIERS_pkey";
       public            postgres    false    220            z           2606    295512    EMPLOYEES fk_employees_employes    FK CONSTRAINT     �   ALTER TABLE ONLY public."EMPLOYEES"
    ADD CONSTRAINT fk_employees_employes FOREIGN KEY ("REPORTS_TO") REFERENCES public."EMPLOYEES"("EMPLOYEE_NUMBER");
 K   ALTER TABLE ONLY public."EMPLOYEES" DROP CONSTRAINT fk_employees_employes;
       public          postgres    false    4721    219    219            x           2606    295502 %   ORDER_DETAILS fk_order_details_orders    FK CONSTRAINT     �   ALTER TABLE ONLY public."ORDER_DETAILS"
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY ("ORDER_NUMBER") REFERENCES public."ORDERS"("ORDER_NUMBER");
 Q   ALTER TABLE ONLY public."ORDER_DETAILS" DROP CONSTRAINT fk_order_details_orders;
       public          postgres    false    218    217    4717            y           2606    295507 '   ORDER_DETAILS fk_order_details_products    FK CONSTRAINT     �   ALTER TABLE ONLY public."ORDER_DETAILS"
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY ("PRODUCT_REF") REFERENCES public."PRODUCTS"("PRODUCT_REF");
 S   ALTER TABLE ONLY public."ORDER_DETAILS" DROP CONSTRAINT fk_order_details_products;
       public          postgres    false    4725    218    221            v           2606    295492    ORDERS fk_orders_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public."ORDERS"
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY ("CUSTOMER_CODE") REFERENCES public."CUSTOMERS"("CUSTOMER_CODE");
 F   ALTER TABLE ONLY public."ORDERS" DROP CONSTRAINT fk_orders_customers;
       public          postgres    false    217    216    4715            w           2606    295497    ORDERS fk_orders_employees    FK CONSTRAINT     �   ALTER TABLE ONLY public."ORDERS"
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY ("EMPLOYEE_NUMBER") REFERENCES public."EMPLOYEES"("EMPLOYEE_NUMBER");
 F   ALTER TABLE ONLY public."ORDERS" DROP CONSTRAINT fk_orders_employees;
       public          postgres    false    4721    217    219            {           2606    295517    PRODUCTS fk_products_categories    FK CONSTRAINT     �   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT fk_products_categories FOREIGN KEY ("CATEGORY_CODE") REFERENCES public."CATEGORIES"("CATEGORY_CODE");
 K   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT fk_products_categories;
       public          postgres    false    4713    215    221            |           2606    295522    PRODUCTS fk_products_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY ("SUPPLIER_NUMBER") REFERENCES public."SUPPLIERS"("SUPPLIER_NUMBER");
 J   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT fk_products_suppliers;
       public          postgres    false    4723    221    220               �   x�MP�N�0<�_�@H��Ҳ'�*핋7q�4	vڿ�i����g2c��=�	�H��E��4Q�P���)^(u��1jL�O�1�N3[n�@�$���MTvn@�s7J
՛��-��ݺ���I?l {��Y}�b(7͖�7ܹWB3�2
�ni%ܻ�� l�$�� +G��$
n�:���)��6�%[e "[أ]bɵ�tϟ�s;�{�\R6�w:Jy�c��% � q�x�            x��YɎ�Hz>�"�9TP���~��L����=_BR��E��dU�}>�l�mOW}0����SJ���q�J`(�"������7� ~��*署(T���B��Be��E���Z*���B�>~=V;�N�M���e
��ڱ-[��|ƂD�yV~�qʻ���!r����oTLW,xZ�&_)K�N����r~M��6:|�-S�i��L�u3R��Jž��m�nX���ӭ�O�8�H�(�4SI���);�"�Hr�2���g�_�a��`Z0���Y��e���F��4����V&��x�C��d�&�!0�v�,}��N5}���\��.+ǵu�՝݄�u��s�'r������+��Ïk�p�a������������
����07-��W+Wk�;�K� T���h+��*a�4C����L���v��Lݩ�����g9��/,�<O�3�Z�|�	E�
��9�{���R�A|��zb('�/�2[3��u��2�,�����t��a7M�z)��d�����8Z�(�]��9�g
%q�� �Q����_eъ	����ս�c�pqO\���}��<C�p�߿CF��T�ʜ��r�Ap�m�+�b�����ƭ�o4�մ즥_/l<���qQ��F'�c�ql�U�c�y.?J�o�O�&;��\��7�X[&x@���[�j?/�zo���=k���P�r�r֓eR�(�gގ�e���e�-�^��@;h��=���ˢ�/�F�9��If���,*Rn�&k�h��Q�S�Б�iQб�a�lm��Fkw��6�I�,��t��e$c��P/�N�0�8�p�U1@�|��^_�����2���d��&�7�R!"�]�ح,�EU��)�,a�nP;E�Ri�����h�g��3n���,|����2� P�),<�{ʧ��S�#���[�Tv��G1�
���������n��
���d��=mU�;���J%9ڙ�2�Qe���3������u����,hwX'�(�d����*���PT��l�;W@ ,t��x���[��:w#�n��;NU��w�K7���R&�ⓢ��1-rfYu,褦� &/K�n�t�� +!�HԲ���D�ߨx	�ɝ��o�G�{Y��kj������Ձil�ڬ�/��P�/̫�,��a.�aZ�>_9Z/�t�.�#Ƀ贐�*e�R�Iv���2�.�b�_����^?�%}�\�l����7��r�{AÄ͠�@y2~�ً$zNM�KH�-nY�%}cj=@��!���5 {G�@�{�t�T���3%����DFlX���_�� �;M�>��.1��[�.7���#�m�ß��;P4�E��q�U�:�"";s��S��թ֛�Au�V%��7{�,`�i,�nz�ORU��{�]�h�������^[�Q�;;=���dUm�u�j�+<����MF0��z�ux��M���)q�(�QJ�ъ�@���i%i��:�a�a4,��q���{7�X�̰OK.e�Dq�{YY ��� �`�8�:D>�&��F f��0��YQ�e\��i[a�Nj[�	����Ó��D�����;Թ�-b����˸<�����%���X��3�����s��ܲ�L����L:��ݤ��t��<��G����{P�*P2�@�j�� �Oď��fC셂�JR��DQ��[��hE�n��r��:}�egZ՞�n�=3%i�-�����3��@U�X�[� �]K7��
Y�K9HK7O�@��}'��gw8�S��<���?��I5�1���ēԡm0�R{��I/%�6�F ����m��JW��X���E�Vn�`jE�t�sZ��H�� ���B! .���WP�}�¯��m�>g��?����V��A��([B|U���i´\�
n���k�6�����+��U�_{��&4�y��h�w�6�-�58��>�ر�ۣ�am�X;*�E@J@�"m�A�?G��5\��z��J�ϵjKa�Nu�����ǘi�h�)��tIr���H&�� C�

 �2aCq���2Ʉt�Q��Ė���a0g��~�J�L`Gq �P檝��L2� ���G�r:1�N?\S��{��������$�:��n�F�\���H>�W� �nX�{�	���T�0hOfl(�T_���q��$�J*=��w�2K�
�d����j4M�i���&A�yi7猂>���Q��Y�r��Qs�0�a
Ib4S�0�v��t����'P_�w7-P�7�,���4��Cɐ�G����Dn�r�'�.A@���q10��Gyz^Vu|���yy�>��,P7���@~���'sŸk�4`k�ɠ��6����ז�x���(dC��'yR��ė#��/QB��=r�c�6��Q�3G��we��²}�:_���<��w9=���y��<�O��%�k4ᱥ�4D�2e>p�M�YƩ�m�D������ܫ�\���zE��"�4>����~�CtL
p��)Q�X� R�Fx�� T�i4 /������Ǔ��	�%	�5p�M�<�� �ͻ����� e���J����A��V�v�^�٠Z���SR�*��)�����}� �%Z���'D��)a�_�)�v��ұm� ���#�Z1I
��YT&QU�dX��'2]94
襙��C��T	�c�v�K��aOF����<�]�$i���F��ې����*h5�j)`oe�tb+݀$&�Zzڨ;C�F��aJBh�,�T�^fx*F�
\�5>p�m�{�6N�Qh]/mm4��HQ�����F�e�ڦy�n�in��U��֐�{="#]�H4�'�y�����@qņU�G�6�$(΁�_]<L��rc���FI�>�g��6iw�1�,�(����+���l�~�n�%�DӱdI�ڳ={�!��������_,>$�d�y��I��h�?�	Q�p��)Ae@ʋ�@0�����u�UyVm)<�7��lRQeN�s&]�MF��SRL�(-�Z�]�*'��W�o��)hm
��)z �����Q�Äc����@V�B4!���w�k���B[�h�VS�&�s}�ڴ;���X��2aY"MyDʭ`W��'�@eI�o8MX�N?̷�JQ���4����	�F�e��F�;��ݨ(�	�H�T�YU3���@E��Lm:��l�4.U�K~%�.��	sy�o  ��흭�k;o������p��t������~ԠM�D�!}� ���cs\�K)
O.j+L��U]���6u!w�n���L��E)��{m�=�A�� �|z�~{���Q����A9����v���2&k��{�.�� 5kؾ�����Ju'M�0Z���h@���S�Y�����8�(P�	�	=�3��(O������� ��Э��9����a���S��%���ͺ7��3�^�Ӓ��%4�������P�!F���o����0K��O����BCC���P%\K��I\�^/�Q�{���7�LU?��Y?�E�Pl����G�A��_�B#���t�T��'Rm�v�sD�Gـ�h�l2����Z�3/��1j�����F�צ5W>��v戨^_����)�?Y[֥��v+��H��a�z�9�w�T.�x��� XwI$�y��\�|���j�F���=���$�I����ꡈ�T��_}��L��ݐ�:�/T@��˙�CϮ6%��5'�|k����2�v����&M�G��]
]��_D��N���?�fp��B�� ���ƀߗ ���D4�� L���d�W�!'�qD*��/|����m�v�FC�Z�?��?��ؚϠ`���3�1pKsBZ�=�̘P{d�-��tlak��t��/����*au�Z&�u�9��Ds��5zoA�9d�j2�-�j�&�������V��74�Z�"��!Y?��G !�����ŕnE���n5jA�۞U��a��QJ���6�*zy���T��Qݴ�&�-y���;�2�h�u^z�gj��(��"�`Z����H�!������ �  �"�@�yW�-l���_�mxl<����8��'8���K������;䏏/��,�ܲ���L�t]��������8|�x�-b�:��t{�,�ص�G�����V��+��;��V`��ļ#�	�O��A�m�)�F�o��5�vkKa�F��^ve����t��Ʊ�8�?e����蹅=U�D�^�F;���v���Eˢ<�8�ݺܲ�w}%	1
"d7��9`W�����hvk[MϹ^��}ܝ�@3��P�O�V�������B>+�[�˙m�Sr���+t�/�!w�)��?�Y�@���\Ҋ��a�ڇ�,�K��W'����tm����!��o����Ͷ۲�7oeQrx�I��f�^��R�g4 ����R{��}� �!�p�J��NG�=�8 �62]ty��ث�2�<���>��Æ0�Wo�_I��mހ~��lxx-�  Ui�C�}��@��z���G��;d ��*ߖyTݭ��(�FL@�ԃ�7��U��&������6��;��|Y�2n��U�~������E~� ���)�z�����=�zu��l�x�>'P��"a/��w�<�A�eAs�na���q��a/u>�O���	j"e�OC��u�?65M�?��#         k  x�}��n�0���S�%=�*\��]lb�&���%�`iA����v�"M����Q��e��8X�Gg����f�u�7G���r)(���J`	X��Z�%?��p�$3�d-���5�`O��������P�x�BHr�r!3!5��B9C[CuWBE�D���3ߜ�3Q�\TΧ�WN��$�Bσ�t`>���g����>$c�yn��鲜!�1"ƨ	���Kg�6�ַ�E.,�6�z1ӣ�k������}�y�ɬ���Uq
=��������4����v�?��?Y)䂷�s 
�X��k��~���'���Gs�Suw�N�,�<�s�)�-,��>�{����P���,d��q���$I~ ���C            x�u]ݖ]�����]�������:��I*��t�}�y��8 ��\}g��r*"Ɛ�^���}��{�?b�#�6�!]�)���Pb�>����M��G���f��SLX�/����u6S!`��r������U���GX�X��T*+������W�_yl��ȟ�X�_�ϯ_f�����L�}jm ���燗�0Y�H4ܧ2�=___�|�y��5X�폘���<����>Mݤ����OH�������6�;M{��<~����Xkf�#v"�������G^M�ux��%�:|x���Ö���5;2���}���I��j�+=�6�������զMM�v}
����W���Ƭ�lF��d^�N�����o�t\�I�	O�K�\?���|Z~M�2O�C�^޿���2kj�:�y�����}|�R\�@�δb��>����%9~�� M��	:3��|zS����9m�0N�~}}����}���G��)1YR�ׯ�o?�`0b�M�zmOa {����˧��lsG��;�(ͻ%Ӓ�tm����A���'���������S������'�^)��M���?�?�^���+Ux��:��g<��0=<5@U��~�n Xhq
�?/_���^I�n�������j\�@t,�?U�n�f=Mh�0$������_}��V,�@�E���/�\�}����L`���"�Z�YG���&2^���w��8p�.��诚��D�����__M�NcjJ~������~R��Nyχ��� �6.�k�ZR��x�����ݱ���D�����|On ��J�3Q���_sZm��6v@S��Ht������u5�m���Q�^ߞ?W���j-rQZ5�o�^�{-�G� �A�I�tGV������h#�����/jIEGڊ���ӵT$]2�����RjM*�դ鷢Dm�z���㵳�	�|eTV�SF�k�=�&m��u����p�~�N�S�P�������'�O�P��zQF)��f�$S2�N�D?�+�^lCKz��ꁭ��zg���o_��iS�P?�S��)(Y���M3�ʝLs��lW�*�3
;�����[���
�}���ƒ�H�Ͽ����:�t��,Ӡ�P��ݟR)�1�i�~#]v}=�ub�I��9ڒ:h��`Ơ#�������/GSc>��R0��\o��õ]X��_&��J��í^+E�s�]��zJI�I4! moj��sЈ��D���^��c������"}�����/�W�qe�R��H(�F�s�W�M6J&~ ����T��.[%��uv��>�x�\mZ]����zf�UO�L���Cײ�7id�����?D����s�������}�G�I��ƤrU�v��U%�'�ڥW�~��~����9�!�#Uz��~U*B�ܮ����y���%E݁%����]�C�o$Ud ���oo�P�>���\�m�sDށt�ꪖ�?�
W�Q�.�������{�@J��b�5o��i!���Bt}����{%�Jv`i��|���G�l/���������'������k}�$5[�$S��iߛ���lQ��Lڷl�5{��$���������77��|D��P��E�g⾟HO�M��� ��N(}�ee*Ҿe��Y�E 5��"EY<��sW(���yE�)*�D-�0$o6�y[�]��?�֤Tz��� V���U��LJ����uXܠ�v �����~Z�d%E�㗷S���X��js"5Y�*>���+��+��,`�Mb/H��dR}�y���Ͼ�'��7��2�NAej�{��S!*�#^?_�~����h2��]����JڏtJ
�쩲�dM�PuO�l�/N׬x�Ѧ>!5Y��j\n7ﵨR�@����Z|bD�C��?���w���4ݩ�Qo^���'Mm���% l�&�AU���ܟAIf'��3iߢUD?��NB�D�jQdҾ�W�I�[��v:��9h'UI�u9~\���4+TK���7������� �����:5�KȞ��T�I�:�R]h9ߐ�ϚI�8i�����~���&�m-*�
}������k��Ұ� %Fe��2@�" 	4�X�[W�V�D)��+l��^ɿ(Gu!.Y��kZl,������C�y�h������3�bM��	���zX����n����ͬ�
�P=�j,���d��X��_~����O'�V���P��~�̲[��f���촐Ze��d_H"US��p����%��E\���ae�t�T^��AU��U[���� DT0����z R�L����!�B�� �֤X��6��q�J*���ܕU�Od"Y[[��.Ҳ��'��B�R8�4p���:.U2T�N��g2��� =�K�N6�=��R���;�m>�	ޣmԙ�~ѹZ���#3ӌ,�>��$�?~��Eӱ�LV�~�i\���l�5�'�{�q�ЋmR�E�y��>���Ԣۿ<�����M�:���x�Ԯ���X%&*D�W�߭Wv������Z�w�UH�
W\߾}[�ʋ��8�L�ASoA�k騺0t5����&}Q�
����M�Y�����gMZ��fe!}U����Y�P)I��ݛ�hwQ��\K�#��=[JkZĭvV��������d�q�Dښ앖�R��1$;��E�����Ŋ!MY$Mk��x���'eU407PX��a���
*'��|[�N�O�oBG��?:�l���t\S�����-�ź�����>#jUm��
���de-u�>��?�����Io�J�c�4�$���q}BcSæ�������J
V�A`�P?�� ��UW"���ϫ?��ZWdV5d�׶I;dS�V�檹!���UX���q~5��15�)C��7:c�:���E�|�;��Z������m���J2#�+��'��o�ǎ�U�#��'���C���!�v,��ƪ�ĦX���Y��RѰ��~�n5�V_�ػ��u�i��mbx}{���c��@Ukjl����\,j�>�սccɰ�CR�zMA����J���W�&��9�:.�I	�H�����I��-W2e)>��nM$�_R���ɤڤ�V=�k��ղQ�֠�vI�)�����,Y��Zzm�����e��uZױ���4E�y����A蠒���ؖ�ۯ�{%�^lk�>�z͘� �"��Kb\� i벬��).`,kף�fT{1ޡc��ٺ	��uOu�	�nC�v]	�g���UI�w���M)+K!۬H]w�+��bVb��j�z�T<y�Fj(����f�NZ�,U1�Z�C����(�T�0�zUk�l�JE�:��{�؉�`�'��EK�9�^�
�Z)k��8c$�B�v�
ُ�t/l;� X�5u��
?B��HHj��N���h����>:�pA3$�q������u����"��IE	ғ�T����u3x/v^b:�EXG�iP�1i��y~��e��r�"���zu�J���������fUI������OG�yZ���D�����a�?��2U�z\�P֗��d�f�+(��I
�Ԭٯ[�9�5R֬d�H�'���^�,��Aٯo�[˟T�6���/��V��eM�mN|P
��xX�;�$v�5���#�[����G���-����WP����PC�f��f�o�י2���%9(�yR�:SP�z�ص@ں���6�MI�`����J�m�B ��*V����a�Y�=��B��� L��`X���ceun�[b6�X]$.oU@Ԗ�%7���,!4���6M��jH��о9߭�* ���z�V�cQ%�'i'��ZX�(�Tmk��q	m^0����m*#r�T�R����a/ n�}k�f�T���T5d'�N(�,�Z	ݱ��m��Z�]X�uI�XUm	RWm�ߠ%����R[����6�@�v㢰���l^�1~��G���	Kݰ�T��:�F�Z��^��� c�
RB��7�fg�Ab�$����F#��l.���uz�%��-Sp�u��RX]0��nl�ȴJ���JUle9�c��١a��>jy�r�	�
���<��Z�����XP�    _�^?����-Cf9��M6�@#��Û7%�/%tD��'T8,���ň
L����k}��1��R0l?n7,;�R�@�!N�Z��j+K~��`��pW})��R &@��'�l҈,f	 �\Ì��̱��R�wY�a�����"�����V��Wҗ](��I�~Q���q`߯}6�mY��0u��*w�� X��/5`&�hN��Qh��4d��!�~ңitl�^YajX�f�z�1a*R������?�0A�*i�.�i�r`b��%��ɘ���^1�wHc>��)ni�4<�J�z�F��n�5�o�6Bk"k�zq��O�4v���f@�,B�r������)��5s:�_�M��E��4C�q폫<jH�
m����	M����nR������w���4o �yY���c4rC����lr�`P��$�����׫�Î��9E"�K��iO(qDA�� �r!`Ӳ8��P���";���Z�������H'�}x��_id,�5"	��+�)�N�nl$�(ul�v]�6cޕ���ڲ��8¬�%�s�&�,�&P܏�JVk��*�v������}�̍-��DUY ���i;�V�rE8�
ukn��p˱ Y��␫�J@W}�[�6w+	Z��J�ӑ�A���H�.V�Q�A��ф�����R��t����f�ꂪَ�k����q�q��@�f�/�f���gn)4[%������c�!c2�
�㖜���t[���P�dֻ+$�V4��}֠� �� ��}�~Ug,�/d(,lV퐫+�JcSYgB��]���G��^Ia�4�}��]C2�Z�h���ݒ/Ҫ�X�^����w���:-�����鈵�Wr3x�`��Xqw1����g�q���ښR�Xá����ߡ���G#����yw�=Ņ��ǮM���-J����6s��[���p�4�M6������P��P��_�h��A�s ��X��(�u�������)�F+s��3q���]��ch��0X�ϳ4�GK�N,���x8.�ݒ�R�B��G�㙠͗�Y"VM8G?>k�BT�#�{u�NN۫���mI��k�d{��aѨ���v*�z�!��r��|�������T]#!�����w7@\a^BT��J���J}��������S��9iJ�����9%aii{��K��)���U�qмx��uI�p1���-y{����T��O��^|���Q����:�~Ic���F��#(oY0�B��1�'���8�� +)���4���\VN�@��Uij������	�HMsBI;�X-lv��.@ֵ�����C�0�d� >�~��#�%���z �GP�6Zud��>oW܍�(qfލ��Z,~�'�~����m�؋'�4-%�Y��w�(y5mӍ�-��Z�+�T�w���6U�Z�>��VҢ�&��*kGO#G�lfHK�/�m���nC�AR#\��#dT_dK۷�,Z����=��Xv���F��j�ܠq(����o��~֮��5�.�d���ZU��\|��	e��p��0�B9�����2x'��'q��-���ݰ�c��X��~p!��N�N�1�>Tgo%���*��ꡍ����VfD�p����ld���y�[8�[D[A�>�g�|���6�>��dug֐���&�O(�pP�E�_y4����B�J�h��`yd��p��l������ w�|���4��W��ȶ�-&�,~��z��>ګ��JC�����Z�nkћ�F��}�P�M4��D��>f��x�����Ӹ�[»}v�n_o����a͑í^��[f���#i�hЬ>K7P�մ����� (	4�Q�A?�ی��L���q^�Pnj����m�����q�"�H_�I��MKji�כ�G��-K�ZTͺ��qШa6��c�oH�.��F�?���� �6����PRC�}|�,�i.U�a���p�9vH�<�H��4�����h �"��/�X&�J���1@0�"�ݙ����{>��!��*`/޿� Z�6��zȿ���6B#�^ƺ�Š?�����ߠ�v��Wz� Ҳ���,�=_������U=ěLKk \�&�m׃�A���WoC{�
S��c4??���w �j�׃e�����=�Y�Zw���mVtT�x��U���vR����1���GPOh�g�P>�@����!��!tHx�W:	٭�!���5f�
���v�2�sI����C|���M(�zK�+�@�t?Y �B�k� ��^tb��T���g�64ު��P�ҢV�d�.�ʗ�V��-�o�7��Q+��zl�|*V=�:-�C䘀uJ���ǷZ���:-z���xGf	VMݻLn��.�Z����W���Ş-�"ٴ7Q��w�ͅ������7h�)2��:��o�e��T�s}-�BUuZ�ܼ��V���\�e]�l�͖B�2b�$Bzbi�M�H:Y ������R�g��]-׬��0U��],�����w2k\jܤ���*ս�CT��>���R��˽͞�R�W���y���HI�2k��t��{��ȯ*h���z��>��"[m%GT�ղ�zm>�cr�A�e�%�z�޿y��k��;')����<��!F@P�#%�P���,9�����Ԍ��`F<��h�hP�^+w��4ۡ]���WM��#��ݐ����p-M�����NQH\TU���!�l?�ӱ�D��6�|ͳ������E�3ɏ[V�Nc����
徊6�<��Դi����w�&%�f�6 ��2�z;�伌dK5�~;\�y�U%)7h�_�[����R��Z�s����9%F���a�mH�~1���0)�¶l'�����Y���I�l�4��:�Fz$��S��*?��6!�H�,��y'��>1>9$�8�6(����<��á7>��u;ZEߨr�����R0����}��sО�����l2b�4��ub9oW�1	�U9���h��R<�ﲜ���}|7%������.�FH;���^�Qh\�؇�����$��B��2���e�H\�\[��Mş��G �N\^��;Ga�]��cq@_;�����o��%KE�p1>�z�r%V����M���m=�9B
Q����2e$��t�Bł��Gx�jR��q�e^�~����
�@�f�Iy��+��9	�:c�~׌�P��ֈ��wU/��^G�!b��!4�wPV��t5e�c�Y+�r�O�1�M�d���Vb�x`8��pV���U'�D�`PQ5ODԠ;N8|2ew#��f��d���z9αϾ�(��B��b�.�p we���ŉĦ�
��&�4�S����Ĥ)����{�!�� 9�c���s��l(������J���E���F��^� h�ȤZ1� �R��5�{?�����^O�}�e������Z�b<ؕ$��T���iW�<��-��ZofwY��duKU�8��Ϻ�#��:gi���X�Y6{D�[z�U#
q�<k�KZ�X�_%�JU��M����c!�j�����b�J�q�M�����3��T򄖫k�$��n8����QI�g���%G`�Ul�3��������M���\R�r+�Yg)P�M��wW��M�d�}I�vU@#x�ɖZ�aң���i����ɠ[���ԋ�R��
�/���W�]Cj�Zѥt59��Z�Z��h�^5%�f@SR%hAg��D��^�$�|�u՛�B������I<��_��B��2��x~)�C�M�f��n�4�%Hɚ�GJQ�խF!�����d.��*sr����Q��T�\@��"�#S��,��>j�}-fK��}&�U��F*+[n]��#˿D+�Q�j��Kd���É~g������z*d/����w����9�3g<��w��������Q2B�:/���>�}.)@��)��*F�E@�jR�K+����A�U��$� G�Vc�P�&w�+\���H���=��#��-�;g]YU�9�׃0+�֕5��S��HDߒ�B��� 2	  �5��b��lI��H�V�}��}_���=�?]�*���zF��\��C6k�sn��!c�p�:�?���.��ww�.\���Kw��cI9BT�cCo:�:�f`a�-t��� n���h����U��,��cFi�|Ղn��%�J�޶�r�������e{��a�@�ô�"��q�73r��aem!_#�u���oض0"��jzV7��ē�.�#�^"�`;��2��j�p��J�67u���d�{�=�H��(��;<�\r����~���R�3ju�wn�D��]d�lQ�|��z��L�x'i3����v�㑜T��"��z�u����	�ڦ�Ý:ȪҲϒ�=�ďtH����鳫�˺]b��Mƚ}�%>��ڛ$�t;�l�.��~{+l�����&�8a}:!��/4���C(s#uz!0��;��+��WmOW _{F�~j^��גsX�����,�Qe�zH���]�#��4,Io]p��sK�nN������3�Kf�%^��M
犉ۂt ��n��b%�wzϒ�䚁9����
k��1��;�4���Ys�_�V��� ��5k�\�f#�"�j�p�n�USG_Z��e�tҤӜ��^��bg�h*g��������
F�5����D>��
����|��C)� ��U+Űi�I��H��=��q�T�y�bM�r���ЪV}+C�!�j��Q��i��d���Ƣ<猸����DA<�e�U#`\�Y��N.�˜E���%��oU�҂�Fi��*�Y-|���ʪ�W���AR�˚�Ő-A=����?�9�sC��'Mm��o�v0Z�p��j˞e8Z+V|㬗�W�Ý%�LhZr���q�:^�薡o��.�z(����ܡ.�G�z���o��+kf�K���)�.Ｌg;⾰G2a����EsS���!�ժ,�1mO�M�ؠ��-�<�������&��o��P��`2h�&�6�#0j�bN$�����piG�`,������C(�4�Ն���"�9�-� ��S#����� Jy�Â��k�=ج?�(~��gI����)��UX���ՠ�*	���r� Ը��x���[�Wz��7y�6A:l����d�{����?X
{82[�e�Ƽ;�lrƓ�(��Lz�u�&gZ�s��� ��4{h���6���Hm�cQL��L�U�ɞN�f2�|����8�w~2��V
�oNr]��W_�e�hh� �����x������f��|ewXR�O�P�U�AK��#����G��0Uk�����q��b�ؤ풠_ӽC��J����U8_�R4����P{|gjm��C;�)�S�� �<ɚ�TB��z��n氮`O�$�\+��0��q�P�pG�l���l��ģ���^K�`{Tuh��+�<�G6�J�������G����I��+omO`Ȧ�b�{R�@w�gg=�����S���6�䴿|�`5�+���_^��*�n?�N��@�h��S�䡂� �FYf��Ң=�b�L���*����(�fz�ǣB��V@UL����m�e)�R��X��d)1�+���0+_烢uqIe����:�BGf��%/ul�G��А�q�Q��;j�V+�
���"�J�T8kº�{�z�+�C��ҿb�ڣҵ�[=͹IQjCY�T8^��?\5Iv8[�3Z��J����6h���o5B�2�9ٽh�Y��N�ʣ���X4n�A�j���n�%��b�1%��"(#�kiƫ��9#m�qT���m��P�v`ϴk�z���	�ٰ���Kmh�Ւ��W{{
��^/hZP��a���d�WX�ГSn��j��4��Vs/@�ǈG�g_jX@��=�$��Cj^�Բ�1�{��U�f�@lU��b��M���J*L}+�(UFT��%�������iX��
���r0�d}N�l� �B��~�@y�����"\#6O1�Y�&�xUpK�H��L�Q�@3��z�pOr懚4�ѻ��"�z)ZMG@O��>��@�rk��ߎ�`~��^Ui��Y1?�,T~�J��Ϻ�ʗm�)f�i��F���9�|M .�!��0��$�D-$����ۙ�������}�n��Eo����=àڋZ}��:��� ��ە�t��8��sh9F��������%�vl��w��"��i�H�D�c�~���6�v�P�nG�Y��E�xĿ�A�y������W��A񲚇1�:h�r��/[o�yMr��� ܡiD>H\_h٥�lru����X�=~�KA��d����o���b1�����*��eg���8��,�}f�;D�r��EV�&I[Q�r��O�����а            x�u�Y����E�O4�SC_���H�%�%��_ļl���'�������y�R�{�K忺z��4���~ؾ?�������������_�������oˏ���m?~��v�������c|��o�y�1��L�S��E�1��l�ӑ�G�1��|��Q~�G�1��|��Q~�G�1��|��Q�G�1����1��|��Q�G�1��|���~�G�1��|���~�G�1��|���~�G�1��|����G�1����1��|������1��|��1~���1��|��1~��z��]?�y}�y��\E�r�E-�,�j�-�{�����?�p���_j����ӝD8�|q��1�lLo�؟��}Y���j��YtP:ߚ�-~���E�Z{�s��%��fg{�~[E?�yW����k��',��>��y���&�R_2��9��탔���y^�wY��$��-"-���!��CM^������f�;�dг�==����"O��.��w \t�����2��"v~����Ǜn�����{�vs�	=�q�l���β����wO�q�!��[ü�C,��&�?xw����ؚ��m�"Sh�O�I�F>V��E��~u�1(��1� $�f����>N�|�I�x�q�S��C?F]�绿���S�-,ێ��5������O�LvmU:6[/C�����U�-�����cy��j�zD��T�`���q�o����p��q��e=!�{6�5RH�����v�	�a�,P$�'kk�,&pXҒS���4l�*���5���3����O��EL{>�K�A�>��׿�Єd&1��6�\�l��\����ԙk#�G���0Z�����#[�bZ��Jʚ�b�mG����u��$0��I|�ѵ��.��!����2�Ô��N�aKi��
���vZ��!t�7�y�ּ���������8܃m����ZL�M�����woD�9�ݟ�F�q�����M1O�(�����It�^�z[��$4Ĳj�|	�Ю��n�((,4�P�I��K퉺�V�^�����y���]��<y����@(�7��U��eD�G{��Ek��K�to���6��Y��u��Ȑ0�in* )��&,+,�zNJݠ.�N��^Z!��E��: 6*E�d7㑍�Y�>�ԫN���l]��"���Q=��4�,s�|z�q��s��Y{��,qZ���	���iG҃a�Ml�jO$>f���CJuF]ĀZ�6��)XL&d�i��)�X<��sS|&�o�:Eƪ������G�����$C̭.H�;�3��o�Ŧ���ŜK�O*���A�2�Qn:,�<TER�S����`�a����khK����a��c�A���C`=�Xk��ݙ�h��x�f����]W��.�G�})��9�ԻNV��7o n���g�o�&��G��/�!ޣ�ΚΓ�r�G6�D�ʚ�a��n�	vU���s�-�o��͂���w	�:��`�BW�F��,�5�f]�'
!��Z�1DNL#�Ґ�|�mҹ!5h�Іm�e\sr�$��?���YKlB>���esҵ����ƕC.9`�.*5'�ڞ���PY���˱�XWr�[gM5���-d��үd�T�����aՇ� IV�����E�̗����<�M�6�Zz{9��O`��iUW��To�F�5�0�Si�?	��B0�~UIo��R��|���?T��*\���i���M,�'䏷#��Ȉ�N�+*�Eߠ��B�c���mj�@�/	���o�C�mc���ɮ��=��6("�=����MoC�a��ڌ�d�7ɲ��Օ�S�u��i#�������%��޵��ij���@K̸j	���0�Z(z�\p�*�f�B��p�	�k�s�`g�~��VS�or�����۱$�#>�@J�ΰ�Og!���nC�ز1|�M�B���$�\���~��C�h�k���R]����I�U
�[�	�&_є�"L � a���J*0�/�A�����Ga�l����B@�0R@[�'�kD�㉾�,��C��3�l�K�æ�$�N��N��΄�7�l"uS�#=�E��ې�P��0�!A]��)����V/A]��C|���Q���f�;�k،�f��JeaK8l�hǂӝQ�';t���ꈂ@nV�^P����Ew���9#3���z�>��z(��Խ����1#�M)�k�ve��&4��iSꫛ�"��� ��E��	��u�|��oDl5|k���8�?��2���u�6�!��@����ck~5��'��'v����.,���hr���_�P�`���!������I�T�0��wv�f�0��:1(�n�)��C�O)��ŕD��Q'���1���Y�f}��ҁ|�=Fx(��o荠�BhI����+�W}&�#<}�펰�|橆F��0���`����V}KJWv?5�]b��iF�|mԭ<>���'u'�5�1��S.q`�&���U�ٝ��s���>Q���46n�N)��)J���wƾ�m.rI���Dث���8R�a�&�%֐�%d����,�X�ox'.?dy��n2,��RJ)��~Ӹ�ƒ"4�OÙ�b����� �6���.�B�,_�1�h�h�Q��p&�Q����_e��D#O�-���A���H���.9^���P7�X���>�c>�P���&ͅ0ϣ��BN�}]	ƭni۲t��A��N^)��oi�4UY8=�;&�9����{���؝w7��V��"�ZfL��X�X��4�0�tq��=�B-�6
*��L?�>Hsc]V��Ř̖��ka��5'&�{�l��db�yܴf-A$�1ِ�	:�5�"<I�C�ӑo���v�5
�s����\�V�@+���_�ҺWt���b0�N�s�U�ߏ��`��゗T��Ea_s�]���V�b�v�_F�����v'QĮЖ��6%�������j�H�Bw* SʉQ|]���S��#Q%� ��rsx;��ɋL�`7��Fo�nkh���c�n�s��;H!��0D�[}蘁7?�O�v.~�*\��}+h���1<�<��@vj����^��d~[��<b��� t$�<�y��k�q���1Xs�7�p�Q�dz�.za�7nk��?���g���)�cy焔j�����S)V%�ˉ�W�����(�s:8Qi��Ϥ�+��S[�]t��?
���2�c��@���Ȯ��u7#7bn����JnӸm�Z`7�*�'��2>�Cqz_G��+B�<��'��x�ۊ�,�5��,O@.��'�_��+V�'JYg"[�}�ԙ?�yuJ�x��`���P���o��?�Z�،�x0�]�� }FS��J�@�t#J~�q��f��}��9b�L�aޕ�
�sz���|�'��������*C�~��c�Rȅ��!��
cH�W�O<���U0�"&|�$6�|`wE��+=XW��K��`;@�t��N9О�줛s>CX�m_����3r��r�O�:���^��1�yr��^=��P��j*cK�=�IY�%.�&
���*���̧��P�Oo�c9�O��^��[�k��X�B�=�g�e���#�B%�Y,�C6�\�a3.�/�IN��9J]�Яs�vE�3��Jǽ�{]���q,��P��$l������t6��˩�+1�R&�x[5=:t�;S��8i�`�<�*T��:�g��~K'�W�7��t8*�[s(�oqe�@���G�Yí��\67L���y� 5������*�LF�������Е�b�Sz
r�1��|�ڪ����O�.��͠ja.�֌TMs$�DI�n�����н�q�8��"-��xc�ה-?�����R�׿���ő���fR!��ٷ���o]r'�0��W�����ڰo
v��Y�vn���CBc�{�K�l�_�YLfUUn�����V�C���M]>zB��g�U���c��o��E٥���������.���Y�;�p��5�V��'Ymtu�oK#����1��e�O�,��;Zn�~q,��D�M    ���D�l�ś�Eos�wm�BNm�1B�Q���Ri�]��h���ܕv=�h���@��{va��M��8[�l�4G����۾���*�����٨�Ba�h#�bV&4� ��/��t��Ԫ2l`�ʹ�U�Cȭ�u�M��\b�Ú���*���&hY$�����0퓝�9���Lb���`��1�pF��8�����׆ys�	��!�]�m���C��A�A�	���*�9�
��^�|�D��Io]��qc��߀�s�s�Jn��|;*�C���4o&]ސ�+_��Un� �$��,���Zˬl�Cثְ\Rc��o��l�OP���q��^�2zC���@좖�D.��]�7r`<$y�́zio���Փ(f7�#�������\Y��{���^�0�mok�z�A3%1�VӡkKݽ�"��K��^��?����@�E'q3��>�6➡d=�#�\��mX6�0סWZpd��
I��RZ'1�͸)���^6��������p7J|�h��̿P[��.��$c�ƇtD�/���F�̿���#��d{�5�<S#.�X����,
���L2�MTi&�+�M{��Q��M�I=�/��Qi����B8��h�%A��FUv(�$����3оB1`���b���3�I_���m� �i#8�6���H��Ea��^�]��
dk>�A�)�4�8�qf�������eV�"��B��^?1n�a��1N�L�-���폳C1уY�:�r��=֓���$]�U?)���#/^x��\�u�����km��6���J_mQ�і��	Ҧ+Ӈf�ͧ(��c�]�ZV������%A9�&u�Z�ͫ���б�-��]��m��s%�)��2��� ��Z
~���I�,�M���Ws����UG��Y�������_�O��8����:�i��ۯt)��p�Y��>T�~��ɥK|��Jԓ��%O(	�/C��k�� ި���	�H�^;O�kp�$f�勼� ��8dWCPzȼ��f� ��B<��8���~������8��44�T��Cl���.�X	��+%�`���+[8ա�t�������w�UE(����pz"��)�!"׻�s�l�C� �>!4�&Y°L���m�\�Jp���]3�8w�����}`v��v���|��9�6Ɓ�P�}(4���N]�����6䐆P%S�;�=������w��(����e�d��%���3�P��t	�Y`-}�?s����/�<�-��9�j�D!���i���2/�[�8ģ<Us��c�������2�.>��m�t%�KwZ���Z��U԰�`�������V�^��fԜ�m��W�7�&P>/�5�R�Ow��I�a{��or�������0���ǈkʣ&T�]�ƹ&��&�E�ϊ�A�mC�_q��K�*���m���"`qW�����Uz@�3�֔�<&B��=�l��{2��/O�f�z̠`�u�\D��$A��q�VR�Q� �l}@�𑽾=�O����@�����r/е�#��� �;�9�	��ʥkWZҙhG��nԶ��*K��
m�^�dR��]�|�jU3	5�T����-�5ѐ�;�r�%	��l�6���1w���+:����]��X^���a�0_��@��X��M�l�����Ю�V�bt��ȱ�;�A�\����b�;2m�(gw|���-Z��e�&k9H��Q�d�U�s��'Y�(�T}C����o�k�#��\�;�y����A.nC;��֎+��#�p�G�|���)H�i��1kG.C��(-b��s
?�V^ё>x��`�r��;��Ǵ�U#�(��`6?x�O*Y%( ?[��Ȇ�k�O���`>�Nq��^	��g�s9S�hs
16o|��wM�)���[���Pk{rh�3�]��zz6�a@�
t3�����%w*��{ہz,��
D�M�m�$�06�C	]�
��Z��'��`"�����F��
����JuF�k���9ph�.���Y����]��^���Y��ʑ���wSӖ��:DeX��2g֎%���n�������ӠȀ���7�}`H�?֖�53������h)�zi<��*���pꖇ���b#����a��+:@�t��,�_Υ4e���O\X`�7F�sw�������|��>y��<h�:4���쭡!:=��&@O1=�՚�	��^3)�ha%��|$O����H�w�f�r��A݃q������~������r�k��*P�ҙDНf�TcX(7��Ds|}hN����\ɑ��S���d�a 4G���,V�8(~�1��S
*�(m�3xK}"ɫ`�r�@��,��#����%2u�2�+�L{#���¿E�nU�؜!دb���6�\WO��4Y��c�qFאk{�7f'��5��kG�a`�;E+���֭
D��Q�*��mF��䣾b�M�M�
Y��fF
��fO���T	C�v(����R��*�H� �]��d���%�h�}u�C�I12����1��q
�5�]}D��ۡe[�����'��0���S��0L�se�S�O��a_X9�� �LF=Di���ƚ!}S����I�=Yӝ������+U�wG��I��Cžq�H�"�Z��A~������Z�!��v���|Ĥ��ݝݱ�Ѹ�6e���qt;�'VܾTZ��"��P�������<ed�TGr%���$�~HN3,�:��fP�����#GV%#	��(���Ԍ6�x���>3��)<4���פٳ��e�,�k[W5����i?�&�����0�i��B{�QR�b!�^5ם��U�5�{��k^��yڢ�]n�U>��zp��dwW����It�ޣ�y� ����C���L��>�A�ѩ�v�ΛTc�9�s����z�w�G(=б��������>~�T�2R	!�Y�I-&hC8���p:W����Y0�s����)�M��1a�1?���X_d��Ƥ��Iߤ�M��BK�x�����g����Ȥy�~��{�m�$�$�oW�^���y��]����X@����t<�#�X�ԅ�+M�>8TLf�Ї��K}�(�0���p�k�opV9�\�����<��|צ	b9RtG�U>'�����׻�9+��R�b��4�PK�c���W��	�s$�������[�+D�Q���a9���*��Ɯ��묢`R9�@��:���Kĕ��c~������0�c��h��T�뤥rFhG ���!�#=Q<�������*��3�����i�/��Ԥ-�C�Ռ�m�~�R8���|�#�"ql���YH����2)�����_u�3�p��Ye����zT��2ʆtx�'SX;�Z_W���*g���:+7ӸN���Ǐ��BC-����#����c@�pvG@f~��癯ӎ��S�3�:.ή�f.��|�@�iuo�y���5v���	���/E��|R��}c����}{9��o�M��i�H�;��_�z��aTQ�/���ں#�o�ٝ�>�oPUYH3dG.$�I�))�a6�@���h*9��ZZ` A�
٦� f��=6C���稿��|{�ɻk6~t�;�Q��S������`fw��06B��)F�5����jq��=z]��4�3���N��]�x�Ni��~Z�4n����9ɯv_�1+�>�3���0�r��%�TMm���Pƍ(*k2Q1� -Z 1+�S����7VcPyJ�+���W%�R��ҹ��˥��)�0B�r��ۉ
Ur݀���#�`4�=2"���2���'�UU�t�6��["�E�s�G����Ⱥցi�S�C���J`}���O�`�Ugd��������S���Sb�1S6۸"����5Q�'����>,CUD�)�F[���Գ��|��s]��,��OT�㚳���Y������O���s��И�W\��<�frۃ?�����$$؜zǬt�دi���������/HF��+ܾ��Z��S#QX
��BgQD\Y�y� �	  X�5�9�7���9韑{6#����<�q>$fX>7��ՐB�DĄsP:�ρ�c�ִ�##�(�b��1�WX�@6�y`�t�6����bo�wzoN.��r>��j8�*�̜=��d40�Z���Z��9Q]0�����뜵���������>��d۾��������M:�c�u�OhDJb���O�uN^����R*w`	6��@�z>�ҹ��~Gq��YV^b�[Y����|�!%�`�Fd���z���nZt��2!��Z���v�ڜ�"[���ٯ)�c����P��C kI���T�f��V�i�����S�)�[!b
�r��i���Q������p�^sFv����}w��'=�.BQ�]ϼ�r�=e���XϢ1�>a��'e>�����~���wiڢ���,���mͬ�/E�Ӟ8�ى�U�%`��)U�?6�9���9*!,\~x��vG6�ݷi��+&9�Tخ�`��MX�3�*Kr��=4�����U�h;�jZ���r�;����Z�]N�r�;bt7>w#3���4�V3�}��//�����]�����
�*�?�6=,�Q��c-q�� ���JA����k�!ǡ�/�x�!����`�*UWv0w�2^w�e��ġtN��a��˶LJ���������צ��-mY.��@���q/��P8��.�B�	گ�l�Q��ten�����ԇ�� 8E�s�<�3J����,,=ddV���v�>�{�%�]���~��v��m��`�[�څ��c'�8�ck,����=�q,�?������X� �-�J.9���^�{5����)������][�t۪+��cKB�1[��iL˜�`�+J��Z5YZ�WX;�ת)���Θ��:�ŋQ�~\����O��ʨ�X�d>���ӫq}��vW��6�|����EP*c-�`�є�!���5��^S�n}z>�?ם���}��qv�f^Ǿӹ/�-R�uU�S�kg�T�@�Q�{ڬ;�>|_�����"K��j����V$a5��Og����-���Z�R�Ț� ���	F�e+��A��Y���5�"��!ua��u�F�7�)cE��.M[R�X���|
�;���O[,�����յ�bq���Q�5f�>��y��ҍٖ�u�{�R4M�w�"�ظj�B�UgT4��3�����Lw$��}Vew"{M�$
s~K�$�������5��&_�g�5���@N��=�k��t���v����Ł3oG�����ϥ
�.m���Ǐ�z΋?֤��d}��S�k������n(�L�j�9�I^�b�W��u)���e�_�a�!�������p��J�����e6>=^�pظ��B�ө_#����`�0��pv'��.mXk��J/G�آ�{�y���كö�/8,�R{���!��:ո�,Ty;�ʘ�a�S�%��>1c��I�07�ȉt�Q���C(��w����j�r�o�,����}���)v�����p��D_��j�M�s��]!���2$t)��	��L5[��u���r�y�=P���0D�q��9���)���7�S̇Y�+!�o�'\ݙ�KƝ"�l~�^�K�#� �MY~���z�t03���6�b����V~�}fsCb����6�:�����Z���aw��@*Ա�-�_����?�G�F�m�n8~��p=g��瀁���z�����@��uP$��&tAb�曎M�i��-�L��"������q�19�s��g�6��mLJ�f+��Ks���),����Za#����+�f[Wە�9Փ`�߂<�Jul֯���~|��6��R�ay�;����Z�Q�W���CBCd^tq�箰�
�³ާ�6����ïݩ�SѲa�\���ǝ#[��/��U唓[t/w�h�pǮ.�-ra�aJ�W��/�
��K/m�} ��tG�͟����9�b��+��]� �o�忸aM�������BF�ہxa��mFg^+�W�6�c�����-?�"@w��oAmToB��'�{`�sj�s�G��?|t��R��u#�;/�*	VZ��ᇅ�^���:��R��g��y�î�`�����C}�4�06�`����a�"��uJ%ڲ�X���h�?ZrЌI%5�:'�������Q�u�ƻ��� ��r<�<��+�g��7k3�k�^#��a��>�?����R��U��_zz|��oF�(/����ɳCa��.S���_�4�cR�e����?�,����������ǹ���}��е?��x&GH�ȸ�O1�Mri���N�Ci/��ǻi^�C�Ҳ��Sr9W���������l��F��%�m�p�3d/�n����G7�@���2"�hH�rq�̦�Ro�bR�����������:^g         �  x��XMs�6=ÿ���	$utԱ��G�(��!��)X���k��d��K�@N��u�dQve2��3��]�}�vcF�sij������}�:�*���U{LF�$!iAxB�����)5���֭<���&DB��1I@e��4%�;�Y:��VDNRZɶ��'[��$MB*�H�A,%���vf�CG'�5 ,I��Ȏ�SNWZU>dH�a��\��Z��ʩ��&)��;�W,I�Ϝ��9k坜�F������[�@L��Bb �]�9ۛ�K<�9s�11��cFP�n���?��%����!rrflU�5�ij�1��4���9p:x� @fH����:�i	��lO'+@��E+��̇��-�Kj�^�I��}-���SY-腬UK�=�dB	Q8"&.8$6u�o�`o�+v �b�gD#ș2���ܺG�X�6C��}���R/h��&��=e�;��F�ch |�n�	��孃lJv�h	O/��|KG��"�1r/3[ʎ���2Sն�k����ԋg�ҔErX��S5
"L;��������ЙkX�SD��c&b��\ٶ��e�^Ua)ҁ@���RXTXC@��.h�G���7c"B�Y��2��Ki���-�^ˮ���<��؀r�.#��L}s!��$O���8~7"���R���V��=�����>z�N��l��� H��k(��]�F�T�gIx+8@T;6���u����Y�S-Դ]��U��i�q�}M�n��ΘG�nqBy��H*{��X�+����ʺZ��ǭZ*�5����#�DHh��Dv:�Wsp��{�Y@S�,M1m&ȤW�Q�Nz����Ǎ[�e9ykY�F�M�rk"�D�! ��m�V�N�;��Pg��A� ��M�|3�	yc;o��)�I��b�JzN�V�#'ǔ�d�R��t3�nX�k��Z)X���K��9<Y���b޷Ď�3��\�"9�������P�q�J�\������_
�n��h�H?��t�#R��sD�Kp��al];��嚞�r�`���h��	e,�j	.��k^a7@A���ھ.E�l�����Rkz�|���}�T8�f��A���0�\�i��I'Ey�@�NA	gn6����dӁ����$zce��Q�A`?��j�癶wҘ�����8�0ar���^�����گ�]�z��(JV+ȻV��Ȇ�Bًroiݮ���db�_@�,��$�Bʐ#1XQg@6�
�dyD�I� ��
6'�f�Y��4|���F��qߜ����u��ց#Fwp��۩�Wz�W;H�|b�<qS��Bnz�z�r���pL0�h�y�d����Z8[�W1 3�]�O^��@9�7�\Y�����B�uq�{o6��?7jv��5�<l:!�w�4��G����upp�� >���0�(`��;��r�x�����f�lH�HZj��V 6�����x�	)`��g���gC��`i@�$��d�؋���� ��w��p.���i|�1�@� f�yV��rp�Ž�Y x�C�;=id[��T�1\�;�W��<��_ko_	M���a��ҏ8����/�����~OC�y�K0eO(N����TzXcĦ1q>_j�hp����N?aH�K�l�!&��$�{�D��=�W	�؇��Ê!�܇�C�����K5�*;��ҏ��F�g]��/GGG���3         m  x��V�r��]7�����]%�f��kIʲ��RDǩre3"F$L��h����/��^e��%߈��T����>�4$�?���y���ojO�⋦�7.�,�4�]m;:?��fo���t�6��v���|�Y��|(J��oMۚэk��t��L�;~c�f��n㛘'����J����Rtt�C� B<Q�$���z��
O�N<_ڵ���|��`]�wuL�㱻��T)�:BMe���i�b����������N��y�F%�̪Y����/�Ύ�����!��T� Lz��9(���ڍq:4[͵���[�'S=���iBg�͖��-+��6����B�~���WU�����3EQN�zׯ�� ����=[�v����땦Le�'��f��QQE��mk�����*�����kߢ힮M{o{���J�>8�6HFd�P�B��c+�FyV�QI���7�;�4~�7�?�I*�j���7�C��|9��ѵT|���gz�����	_u���w��5�'t�[�k��Aw,A���`���F��8/h���	��*�3�媒�tg��s4g�6���-��3��6�Z�.�������|��֢�*����M�̟g�+A�p	�l�����ڙ�/����g6�z���.�n(����&ƵMjeFcd�D!���*U&�n�>�jO�=�_7!�v����z�խ���M��tˀ,�-��z�]�\��:Bϫ=)��)���э����/!<����~��q�q�v��XX�D�Y���[�QR��<����)��X�H*zkv-�Eh��}��6����7�攋���NT-���#�z͹H��,#���+����]�К�AUP�N�m �&bغ��� _'�*Kš�9M�Ń��'�|P<�Jq�<FF����<01]MU!�<r�L<�LU��8���>��?��z���A�m����C�	�΂����]��2I��A������D�ȟ������ہ���;2NDz�w��6���h�/�Ez������p�2i\��q^/�HV����ݢE�A�al]g܎n�@�[g��{�c`b�GD�wh�3<i�����F%�;u.�gkNp�˴�"4ljV��Ԉ@��H�/`c<����SW��DB3�:,��/{G`	o��4�u���\���`;z�BG����` �	z���TJ���Bf&�G��k���<����ƭ��]��l����k���ыZ������^��>_�~��@�+]5|��p[8~�q��z�1�Cf@*Q��M7�h�"((E��8����Z�N�ZC�@c\���y��Ѧa^�P�&mӶ4�՝����@H~L�"=^EI�G�ƣ�I��1kx�{�a�k�x�n�R�cy�b(v�u(F�gň�+F����y҇��p��ؓ]��)�,��[�:K�:r�.�g����hUD�0o��-l�|x;��#%�);�|��8�bHx�{�������!.�t����z��)�CO�'�A��vY�E��w���+-�"��2��2+���r�odY��9}�G��|����z��r��M���%3.f�ϵM*���e"�tPVg�x���D͏Q�V6�=2���,�1���qE�B�     