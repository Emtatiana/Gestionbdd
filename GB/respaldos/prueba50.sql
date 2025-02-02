PGDMP                       |            Delivery    16.1    16.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17844    Delivery    DATABASE     }   CREATE DATABASE "Delivery" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Delivery";
                postgres    false            �            1259    18768    barrio    TABLE     �   CREATE TABLE public.barrio (
    id_barrio integer NOT NULL,
    nom_barrio character varying(100),
    descrip_barrio character varying(100),
    id_localidad integer
);
    DROP TABLE public.barrio;
       public         heap    postgres    false            �            1259    18767    barrio_id_barrio_seq    SEQUENCE     �   CREATE SEQUENCE public.barrio_id_barrio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.barrio_id_barrio_seq;
       public          postgres    false    236            �           0    0    barrio_id_barrio_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.barrio_id_barrio_seq OWNED BY public.barrio.id_barrio;
          public          postgres    false    235            �            1259    18780    calle    TABLE     �   CREATE TABLE public.calle (
    id_calle integer NOT NULL,
    nom_calle character varying(200),
    descrip_calle character varying(300),
    id_barrio integer
);
    DROP TABLE public.calle;
       public         heap    postgres    false            �            1259    18779    calle_id_calle_seq    SEQUENCE     �   CREATE SEQUENCE public.calle_id_calle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.calle_id_calle_seq;
       public          postgres    false    238            �           0    0    calle_id_calle_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.calle_id_calle_seq OWNED BY public.calle.id_calle;
          public          postgres    false    237            �            1259    18691    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(100),
    telefono_cliente character varying(10)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    18690    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    216            �           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    215            �            1259    18761    complementohamburguesa    TABLE     }   CREATE TABLE public.complementohamburguesa (
    id_complemento integer NOT NULL,
    "añadidura" character varying(150)
);
 *   DROP TABLE public.complementohamburguesa;
       public         heap    postgres    false            �            1259    18760 )   complementohamburguesa_id_complemento_seq    SEQUENCE     �   CREATE SEQUENCE public.complementohamburguesa_id_complemento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.complementohamburguesa_id_complemento_seq;
       public          postgres    false    234            �           0    0 )   complementohamburguesa_id_complemento_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.complementohamburguesa_id_complemento_seq OWNED BY public.complementohamburguesa.id_complemento;
          public          postgres    false    233            �            1259    18887    detallepedido    TABLE     �   CREATE TABLE public.detallepedido (
    id_detalle integer NOT NULL,
    cantidad integer,
    subtotal numeric(10,2),
    id_complemento integer,
    id_hamburguesa integer,
    id_factura integer
);
 !   DROP TABLE public.detallepedido;
       public         heap    postgres    false            �            1259    18886    detallepedido_id_detalle_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.detallepedido_id_detalle_seq;
       public          postgres    false    248            �           0    0    detallepedido_id_detalle_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.detallepedido_id_detalle_seq OWNED BY public.detallepedido.id_detalle;
          public          postgres    false    247            �            1259    18729    estadofactura    TABLE     u   CREATE TABLE public.estadofactura (
    id_estado_factura integer NOT NULL,
    estado_fac character varying(150)
);
 !   DROP TABLE public.estadofactura;
       public         heap    postgres    false            �            1259    18728 #   estadofactura_id_estado_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.estadofactura_id_estado_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadofactura_id_estado_factura_seq;
       public          postgres    false    226            �           0    0 #   estadofactura_id_estado_factura_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadofactura_id_estado_factura_seq OWNED BY public.estadofactura.id_estado_factura;
          public          postgres    false    225            �            1259    18699    estadopedido    TABLE     s   CREATE TABLE public.estadopedido (
    id_estado_pedido integer NOT NULL,
    repartidor character varying(100)
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    18698 !   estadopedido_id_estado_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.estadopedido_id_estado_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadopedido_id_estado_pedido_seq;
       public          postgres    false    218            �           0    0 !   estadopedido_id_estado_pedido_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadopedido_id_estado_pedido_seq OWNED BY public.estadopedido.id_estado_pedido;
          public          postgres    false    217            �            1259    18795    factura    TABLE     �   CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    numero_factura integer,
    fecha_emision date,
    id_estado_factura integer
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    18794    factura_id_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.factura_id_factura_seq;
       public          postgres    false    240            �           0    0    factura_id_factura_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.factura_id_factura_seq OWNED BY public.factura.id_factura;
          public          postgres    false    239            �            1259    18841    hamburguesa    TABLE     �   CREATE TABLE public.hamburguesa (
    id_hamburguesa integer NOT NULL,
    nom_hamburguesa character varying(150),
    precio numeric(10,2),
    id_tipoham integer,
    "id_tamañoham" integer
);
    DROP TABLE public.hamburguesa;
       public         heap    postgres    false            �            1259    18840    hamburguesa_id_hamburguesa_seq    SEQUENCE     �   CREATE SEQUENCE public.hamburguesa_id_hamburguesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.hamburguesa_id_hamburguesa_seq;
       public          postgres    false    242            �           0    0    hamburguesa_id_hamburguesa_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.hamburguesa_id_hamburguesa_seq OWNED BY public.hamburguesa.id_hamburguesa;
          public          postgres    false    241            �            1259    18706 	   localidad    TABLE     �   CREATE TABLE public.localidad (
    id_localidad integer NOT NULL,
    estado_localidad character varying(100),
    codigo_postal character varying(10)
);
    DROP TABLE public.localidad;
       public         heap    postgres    false            �            1259    18705    localidad_id_localidad_seq    SEQUENCE     �   CREATE SEQUENCE public.localidad_id_localidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.localidad_id_localidad_seq;
       public          postgres    false    220            �           0    0    localidad_id_localidad_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.localidad_id_localidad_seq OWNED BY public.localidad.id_localidad;
          public          postgres    false    219            �            1259    18941    pedido    TABLE       CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    fecha_pedido date,
    referencia_sitio character varying(100),
    id_cliente integer,
    id_estado_pedido integer,
    id_personal_entrega integer,
    id_calle integer,
    id_detalle integer
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    18940    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          postgres    false    250            �           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          postgres    false    249            �            1259    18858    personalentrega    TABLE     �   CREATE TABLE public.personalentrega (
    id_personal_entrega integer NOT NULL,
    numero_carnet character varying(10),
    fecha_vencimiento date,
    id_proceso_entrega integer
);
 #   DROP TABLE public.personalentrega;
       public         heap    postgres    false            �            1259    18857 '   personalentrega_id_personal_entrega_seq    SEQUENCE     �   CREATE SEQUENCE public.personalentrega_id_personal_entrega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.personalentrega_id_personal_entrega_seq;
       public          postgres    false    244            �           0    0 '   personalentrega_id_personal_entrega_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.personalentrega_id_personal_entrega_seq OWNED BY public.personalentrega.id_personal_entrega;
          public          postgres    false    243            �            1259    18713    procesoentrega    TABLE     �   CREATE TABLE public.procesoentrega (
    id_proceso_entrega integer NOT NULL,
    repartidor character varying(100),
    progreso character varying(400)
);
 "   DROP TABLE public.procesoentrega;
       public         heap    postgres    false            �            1259    18712 %   procesoentrega_id_proceso_entrega_seq    SEQUENCE     �   CREATE SEQUENCE public.procesoentrega_id_proceso_entrega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.procesoentrega_id_proceso_entrega_seq;
       public          postgres    false    222            �           0    0 %   procesoentrega_id_proceso_entrega_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.procesoentrega_id_proceso_entrega_seq OWNED BY public.procesoentrega.id_proceso_entrega;
          public          postgres    false    221            �            1259    18736    tamañohamburguesa    TABLE     �   CREATE TABLE public."tamañohamburguesa" (
    "id_tamañoham" integer NOT NULL,
    "nom_tamañoham" character varying(200),
    porcion_extra character varying(250)
);
 (   DROP TABLE public."tamañohamburguesa";
       public         heap    postgres    false            �            1259    18735 $   tamañohamburguesa_id_tamañoham_seq    SEQUENCE     �   CREATE SEQUENCE public."tamañohamburguesa_id_tamañoham_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."tamañohamburguesa_id_tamañoham_seq";
       public          postgres    false    228            �           0    0 $   tamañohamburguesa_id_tamañoham_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."tamañohamburguesa_id_tamañoham_seq" OWNED BY public."tamañohamburguesa"."id_tamañoham";
          public          postgres    false    227            �            1259    18752    tipohamburguesa    TABLE     �   CREATE TABLE public.tipohamburguesa (
    id_tipoham integer NOT NULL,
    nom_tipoham character varying(200),
    descripcion character varying(300)
);
 #   DROP TABLE public.tipohamburguesa;
       public         heap    postgres    false            �            1259    18751    tipohamburguesa_id_tipoham_seq    SEQUENCE     �   CREATE SEQUENCE public.tipohamburguesa_id_tipoham_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tipohamburguesa_id_tipoham_seq;
       public          postgres    false    232            �           0    0    tipohamburguesa_id_tipoham_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tipohamburguesa_id_tipoham_seq OWNED BY public.tipohamburguesa.id_tipoham;
          public          postgres    false    231            �            1259    18722    tipovehiculo    TABLE     w   CREATE TABLE public.tipovehiculo (
    id_tipovehiculo integer NOT NULL,
    nombre_vehiculo character varying(100)
);
     DROP TABLE public.tipovehiculo;
       public         heap    postgres    false            �            1259    18721     tipovehiculo_id_tipovehiculo_seq    SEQUENCE     �   CREATE SEQUENCE public.tipovehiculo_id_tipovehiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tipovehiculo_id_tipovehiculo_seq;
       public          postgres    false    224            �           0    0     tipovehiculo_id_tipovehiculo_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.tipovehiculo_id_tipovehiculo_seq OWNED BY public.tipovehiculo.id_tipovehiculo;
          public          postgres    false    223            �            1259    18743    variedadhamburguesa    TABLE     �   CREATE TABLE public.variedadhamburguesa (
    id_variedadham integer NOT NULL,
    nom_variedadham character varying(250),
    ingredientes character varying(300)
);
 '   DROP TABLE public.variedadhamburguesa;
       public         heap    postgres    false            �            1259    18742 &   variedadhamburguesa_id_variedadham_seq    SEQUENCE     �   CREATE SEQUENCE public.variedadhamburguesa_id_variedadham_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.variedadhamburguesa_id_variedadham_seq;
       public          postgres    false    230            �           0    0 &   variedadhamburguesa_id_variedadham_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.variedadhamburguesa_id_variedadham_seq OWNED BY public.variedadhamburguesa.id_variedadham;
          public          postgres    false    229            �            1259    18870    vehiculo    TABLE     �   CREATE TABLE public.vehiculo (
    id_vehiculo integer NOT NULL,
    placa character varying(10),
    id_tipovehiculo integer,
    id_personal_entrega integer
);
    DROP TABLE public.vehiculo;
       public         heap    postgres    false            �            1259    18869    vehiculo_id_vehiculo_seq    SEQUENCE     �   CREATE SEQUENCE public.vehiculo_id_vehiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.vehiculo_id_vehiculo_seq;
       public          postgres    false    246            �           0    0    vehiculo_id_vehiculo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.vehiculo_id_vehiculo_seq OWNED BY public.vehiculo.id_vehiculo;
          public          postgres    false    245            �           2604    18771    barrio id_barrio    DEFAULT     t   ALTER TABLE ONLY public.barrio ALTER COLUMN id_barrio SET DEFAULT nextval('public.barrio_id_barrio_seq'::regclass);
 ?   ALTER TABLE public.barrio ALTER COLUMN id_barrio DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    18783    calle id_calle    DEFAULT     p   ALTER TABLE ONLY public.calle ALTER COLUMN id_calle SET DEFAULT nextval('public.calle_id_calle_seq'::regclass);
 =   ALTER TABLE public.calle ALTER COLUMN id_calle DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    18694    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    18764 %   complementohamburguesa id_complemento    DEFAULT     �   ALTER TABLE ONLY public.complementohamburguesa ALTER COLUMN id_complemento SET DEFAULT nextval('public.complementohamburguesa_id_complemento_seq'::regclass);
 T   ALTER TABLE public.complementohamburguesa ALTER COLUMN id_complemento DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    18890    detallepedido id_detalle    DEFAULT     �   ALTER TABLE ONLY public.detallepedido ALTER COLUMN id_detalle SET DEFAULT nextval('public.detallepedido_id_detalle_seq'::regclass);
 G   ALTER TABLE public.detallepedido ALTER COLUMN id_detalle DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    18732    estadofactura id_estado_factura    DEFAULT     �   ALTER TABLE ONLY public.estadofactura ALTER COLUMN id_estado_factura SET DEFAULT nextval('public.estadofactura_id_estado_factura_seq'::regclass);
 N   ALTER TABLE public.estadofactura ALTER COLUMN id_estado_factura DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    18702    estadopedido id_estado_pedido    DEFAULT     �   ALTER TABLE ONLY public.estadopedido ALTER COLUMN id_estado_pedido SET DEFAULT nextval('public.estadopedido_id_estado_pedido_seq'::regclass);
 L   ALTER TABLE public.estadopedido ALTER COLUMN id_estado_pedido DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    18798    factura id_factura    DEFAULT     x   ALTER TABLE ONLY public.factura ALTER COLUMN id_factura SET DEFAULT nextval('public.factura_id_factura_seq'::regclass);
 A   ALTER TABLE public.factura ALTER COLUMN id_factura DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    18844    hamburguesa id_hamburguesa    DEFAULT     �   ALTER TABLE ONLY public.hamburguesa ALTER COLUMN id_hamburguesa SET DEFAULT nextval('public.hamburguesa_id_hamburguesa_seq'::regclass);
 I   ALTER TABLE public.hamburguesa ALTER COLUMN id_hamburguesa DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    18709    localidad id_localidad    DEFAULT     �   ALTER TABLE ONLY public.localidad ALTER COLUMN id_localidad SET DEFAULT nextval('public.localidad_id_localidad_seq'::regclass);
 E   ALTER TABLE public.localidad ALTER COLUMN id_localidad DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    18944    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    18861 #   personalentrega id_personal_entrega    DEFAULT     �   ALTER TABLE ONLY public.personalentrega ALTER COLUMN id_personal_entrega SET DEFAULT nextval('public.personalentrega_id_personal_entrega_seq'::regclass);
 R   ALTER TABLE public.personalentrega ALTER COLUMN id_personal_entrega DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    18716 !   procesoentrega id_proceso_entrega    DEFAULT     �   ALTER TABLE ONLY public.procesoentrega ALTER COLUMN id_proceso_entrega SET DEFAULT nextval('public.procesoentrega_id_proceso_entrega_seq'::regclass);
 P   ALTER TABLE public.procesoentrega ALTER COLUMN id_proceso_entrega DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    18739     tamañohamburguesa id_tamañoham    DEFAULT     �   ALTER TABLE ONLY public."tamañohamburguesa" ALTER COLUMN "id_tamañoham" SET DEFAULT nextval('public."tamañohamburguesa_id_tamañoham_seq"'::regclass);
 S   ALTER TABLE public."tamañohamburguesa" ALTER COLUMN "id_tamañoham" DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    18755    tipohamburguesa id_tipoham    DEFAULT     �   ALTER TABLE ONLY public.tipohamburguesa ALTER COLUMN id_tipoham SET DEFAULT nextval('public.tipohamburguesa_id_tipoham_seq'::regclass);
 I   ALTER TABLE public.tipohamburguesa ALTER COLUMN id_tipoham DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    18725    tipovehiculo id_tipovehiculo    DEFAULT     �   ALTER TABLE ONLY public.tipovehiculo ALTER COLUMN id_tipovehiculo SET DEFAULT nextval('public.tipovehiculo_id_tipovehiculo_seq'::regclass);
 K   ALTER TABLE public.tipovehiculo ALTER COLUMN id_tipovehiculo DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    18746 "   variedadhamburguesa id_variedadham    DEFAULT     �   ALTER TABLE ONLY public.variedadhamburguesa ALTER COLUMN id_variedadham SET DEFAULT nextval('public.variedadhamburguesa_id_variedadham_seq'::regclass);
 Q   ALTER TABLE public.variedadhamburguesa ALTER COLUMN id_variedadham DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    18873    vehiculo id_vehiculo    DEFAULT     |   ALTER TABLE ONLY public.vehiculo ALTER COLUMN id_vehiculo SET DEFAULT nextval('public.vehiculo_id_vehiculo_seq'::regclass);
 C   ALTER TABLE public.vehiculo ALTER COLUMN id_vehiculo DROP DEFAULT;
       public          postgres    false    245    246    246            �          0    18768    barrio 
   TABLE DATA           U   COPY public.barrio (id_barrio, nom_barrio, descrip_barrio, id_localidad) FROM stdin;
    public          postgres    false    236   /�       �          0    18780    calle 
   TABLE DATA           N   COPY public.calle (id_calle, nom_calle, descrip_calle, id_barrio) FROM stdin;
    public          postgres    false    238   o�       {          0    18691    cliente 
   TABLE DATA           O   COPY public.cliente (id_cliente, nombre_cliente, telefono_cliente) FROM stdin;
    public          postgres    false    216   ��       �          0    18761    complementohamburguesa 
   TABLE DATA           N   COPY public.complementohamburguesa (id_complemento, "añadidura") FROM stdin;
    public          postgres    false    234   ��       �          0    18887    detallepedido 
   TABLE DATA           s   COPY public.detallepedido (id_detalle, cantidad, subtotal, id_complemento, id_hamburguesa, id_factura) FROM stdin;
    public          postgres    false    248    �       �          0    18729    estadofactura 
   TABLE DATA           F   COPY public.estadofactura (id_estado_factura, estado_fac) FROM stdin;
    public          postgres    false    226   T�       }          0    18699    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (id_estado_pedido, repartidor) FROM stdin;
    public          postgres    false    218   z�       �          0    18795    factura 
   TABLE DATA           _   COPY public.factura (id_factura, numero_factura, fecha_emision, id_estado_factura) FROM stdin;
    public          postgres    false    240   ��       �          0    18841    hamburguesa 
   TABLE DATA           k   COPY public.hamburguesa (id_hamburguesa, nom_hamburguesa, precio, id_tipoham, "id_tamañoham") FROM stdin;
    public          postgres    false    242   �                 0    18706 	   localidad 
   TABLE DATA           R   COPY public.localidad (id_localidad, estado_localidad, codigo_postal) FROM stdin;
    public          postgres    false    220   �       �          0    18941    pedido 
   TABLE DATA           �   COPY public.pedido (id_pedido, fecha_pedido, referencia_sitio, id_cliente, id_estado_pedido, id_personal_entrega, id_calle, id_detalle) FROM stdin;
    public          postgres    false    250   :�       �          0    18858    personalentrega 
   TABLE DATA           t   COPY public.personalentrega (id_personal_entrega, numero_carnet, fecha_vencimiento, id_proceso_entrega) FROM stdin;
    public          postgres    false    244   ��       �          0    18713    procesoentrega 
   TABLE DATA           R   COPY public.procesoentrega (id_proceso_entrega, repartidor, progreso) FROM stdin;
    public          postgres    false    222   ڷ       �          0    18736    tamañohamburguesa 
   TABLE DATA           `   COPY public."tamañohamburguesa" ("id_tamañoham", "nom_tamañoham", porcion_extra) FROM stdin;
    public          postgres    false    228   �       �          0    18752    tipohamburguesa 
   TABLE DATA           O   COPY public.tipohamburguesa (id_tipoham, nom_tipoham, descripcion) FROM stdin;
    public          postgres    false    232   >�       �          0    18722    tipovehiculo 
   TABLE DATA           H   COPY public.tipovehiculo (id_tipovehiculo, nombre_vehiculo) FROM stdin;
    public          postgres    false    224   m�       �          0    18743    variedadhamburguesa 
   TABLE DATA           \   COPY public.variedadhamburguesa (id_variedadham, nom_variedadham, ingredientes) FROM stdin;
    public          postgres    false    230   ��       �          0    18870    vehiculo 
   TABLE DATA           \   COPY public.vehiculo (id_vehiculo, placa, id_tipovehiculo, id_personal_entrega) FROM stdin;
    public          postgres    false    246   ¸       �           0    0    barrio_id_barrio_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.barrio_id_barrio_seq', 1, true);
          public          postgres    false    235            �           0    0    calle_id_calle_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.calle_id_calle_seq', 1, true);
          public          postgres    false    237            �           0    0    cliente_id_cliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, true);
          public          postgres    false    215            �           0    0 )   complementohamburguesa_id_complemento_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.complementohamburguesa_id_complemento_seq', 1, true);
          public          postgres    false    233            �           0    0    detallepedido_id_detalle_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.detallepedido_id_detalle_seq', 1, true);
          public          postgres    false    247            �           0    0 #   estadofactura_id_estado_factura_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadofactura_id_estado_factura_seq', 1, true);
          public          postgres    false    225            �           0    0 !   estadopedido_id_estado_pedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadopedido_id_estado_pedido_seq', 1, true);
          public          postgres    false    217            �           0    0    factura_id_factura_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.factura_id_factura_seq', 1, true);
          public          postgres    false    239            �           0    0    hamburguesa_id_hamburguesa_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.hamburguesa_id_hamburguesa_seq', 1, true);
          public          postgres    false    241            �           0    0    localidad_id_localidad_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.localidad_id_localidad_seq', 1, true);
          public          postgres    false    219            �           0    0    pedido_id_pedido_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, true);
          public          postgres    false    249            �           0    0 '   personalentrega_id_personal_entrega_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.personalentrega_id_personal_entrega_seq', 1, true);
          public          postgres    false    243            �           0    0 %   procesoentrega_id_proceso_entrega_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.procesoentrega_id_proceso_entrega_seq', 1, true);
          public          postgres    false    221            �           0    0 $   tamañohamburguesa_id_tamañoham_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."tamañohamburguesa_id_tamañoham_seq"', 1, true);
          public          postgres    false    227            �           0    0    tipohamburguesa_id_tipoham_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipohamburguesa_id_tipoham_seq', 1, true);
          public          postgres    false    231            �           0    0     tipovehiculo_id_tipovehiculo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tipovehiculo_id_tipovehiculo_seq', 1, true);
          public          postgres    false    223            �           0    0 &   variedadhamburguesa_id_variedadham_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.variedadhamburguesa_id_variedadham_seq', 1, true);
          public          postgres    false    229            �           0    0    vehiculo_id_vehiculo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.vehiculo_id_vehiculo_seq', 1, true);
          public          postgres    false    245            �           2606    18773    barrio barrio_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.barrio
    ADD CONSTRAINT barrio_pkey PRIMARY KEY (id_barrio);
 <   ALTER TABLE ONLY public.barrio DROP CONSTRAINT barrio_pkey;
       public            postgres    false    236            �           2606    18787    calle calle_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.calle
    ADD CONSTRAINT calle_pkey PRIMARY KEY (id_calle);
 :   ALTER TABLE ONLY public.calle DROP CONSTRAINT calle_pkey;
       public            postgres    false    238            �           2606    18696    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    216            �           2606    18766 2   complementohamburguesa complementohamburguesa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.complementohamburguesa
    ADD CONSTRAINT complementohamburguesa_pkey PRIMARY KEY (id_complemento);
 \   ALTER TABLE ONLY public.complementohamburguesa DROP CONSTRAINT complementohamburguesa_pkey;
       public            postgres    false    234            �           2606    18892     detallepedido detallepedido_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY (id_detalle);
 J   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    248            �           2606    18734     estadofactura estadofactura_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.estadofactura
    ADD CONSTRAINT estadofactura_pkey PRIMARY KEY (id_estado_factura);
 J   ALTER TABLE ONLY public.estadofactura DROP CONSTRAINT estadofactura_pkey;
       public            postgres    false    226            �           2606    18704    estadopedido estadopedido_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (id_estado_pedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    218            �           2606    18800    factura factura_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    240            �           2606    18846    hamburguesa hamburguesa_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.hamburguesa
    ADD CONSTRAINT hamburguesa_pkey PRIMARY KEY (id_hamburguesa);
 F   ALTER TABLE ONLY public.hamburguesa DROP CONSTRAINT hamburguesa_pkey;
       public            postgres    false    242            �           2606    18711    localidad localidad_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.localidad
    ADD CONSTRAINT localidad_pkey PRIMARY KEY (id_localidad);
 B   ALTER TABLE ONLY public.localidad DROP CONSTRAINT localidad_pkey;
       public            postgres    false    220            �           2606    18946    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    250            �           2606    18863 $   personalentrega personalentrega_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.personalentrega
    ADD CONSTRAINT personalentrega_pkey PRIMARY KEY (id_personal_entrega);
 N   ALTER TABLE ONLY public.personalentrega DROP CONSTRAINT personalentrega_pkey;
       public            postgres    false    244            �           2606    18720 "   procesoentrega procesoentrega_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.procesoentrega
    ADD CONSTRAINT procesoentrega_pkey PRIMARY KEY (id_proceso_entrega);
 L   ALTER TABLE ONLY public.procesoentrega DROP CONSTRAINT procesoentrega_pkey;
       public            postgres    false    222            �           2606    18741 *   tamañohamburguesa tamañohamburguesa_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."tamañohamburguesa"
    ADD CONSTRAINT "tamañohamburguesa_pkey" PRIMARY KEY ("id_tamañoham");
 X   ALTER TABLE ONLY public."tamañohamburguesa" DROP CONSTRAINT "tamañohamburguesa_pkey";
       public            postgres    false    228            �           2606    18759 $   tipohamburguesa tipohamburguesa_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipohamburguesa
    ADD CONSTRAINT tipohamburguesa_pkey PRIMARY KEY (id_tipoham);
 N   ALTER TABLE ONLY public.tipohamburguesa DROP CONSTRAINT tipohamburguesa_pkey;
       public            postgres    false    232            �           2606    18727    tipovehiculo tipovehiculo_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipovehiculo
    ADD CONSTRAINT tipovehiculo_pkey PRIMARY KEY (id_tipovehiculo);
 H   ALTER TABLE ONLY public.tipovehiculo DROP CONSTRAINT tipovehiculo_pkey;
       public            postgres    false    224            �           2606    18750 ,   variedadhamburguesa variedadhamburguesa_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.variedadhamburguesa
    ADD CONSTRAINT variedadhamburguesa_pkey PRIMARY KEY (id_variedadham);
 V   ALTER TABLE ONLY public.variedadhamburguesa DROP CONSTRAINT variedadhamburguesa_pkey;
       public            postgres    false    230            �           2606    18875    vehiculo vehiculo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);
 @   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_pkey;
       public            postgres    false    246            �           2606    18774    barrio barrio_id_localidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.barrio
    ADD CONSTRAINT barrio_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES public.localidad(id_localidad);
 I   ALTER TABLE ONLY public.barrio DROP CONSTRAINT barrio_id_localidad_fkey;
       public          postgres    false    4796    236    220            �           2606    18788    calle calle_id_barrio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calle
    ADD CONSTRAINT calle_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES public.barrio(id_barrio);
 D   ALTER TABLE ONLY public.calle DROP CONSTRAINT calle_id_barrio_fkey;
       public          postgres    false    236    238    4812            �           2606    18893 /   detallepedido detallepedido_id_complemento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_id_complemento_fkey FOREIGN KEY (id_complemento) REFERENCES public.complementohamburguesa(id_complemento);
 Y   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_id_complemento_fkey;
       public          postgres    false    4810    248    234            �           2606    18903 +   detallepedido detallepedido_id_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura);
 U   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_id_factura_fkey;
       public          postgres    false    248    240    4816            �           2606    18898 /   detallepedido detallepedido_id_hamburguesa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_id_hamburguesa_fkey FOREIGN KEY (id_hamburguesa) REFERENCES public.hamburguesa(id_hamburguesa);
 Y   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_id_hamburguesa_fkey;
       public          postgres    false    242    248    4818            �           2606    18801 &   factura factura_id_estado_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_estado_factura_fkey FOREIGN KEY (id_estado_factura) REFERENCES public.estadofactura(id_estado_factura);
 P   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_estado_factura_fkey;
       public          postgres    false    226    240    4802            �           2606    18852 *   hamburguesa hamburguesa_id_tamañoham_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hamburguesa
    ADD CONSTRAINT "hamburguesa_id_tamañoham_fkey" FOREIGN KEY ("id_tamañoham") REFERENCES public."tamañohamburguesa"("id_tamañoham");
 V   ALTER TABLE ONLY public.hamburguesa DROP CONSTRAINT "hamburguesa_id_tamañoham_fkey";
       public          postgres    false    242    228    4804            �           2606    18847 '   hamburguesa hamburguesa_id_tipoham_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hamburguesa
    ADD CONSTRAINT hamburguesa_id_tipoham_fkey FOREIGN KEY (id_tipoham) REFERENCES public.tipohamburguesa(id_tipoham);
 Q   ALTER TABLE ONLY public.hamburguesa DROP CONSTRAINT hamburguesa_id_tipoham_fkey;
       public          postgres    false    4808    232    242            �           2606    18962    pedido pedido_id_calle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_calle_fkey FOREIGN KEY (id_calle) REFERENCES public.calle(id_calle);
 E   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_calle_fkey;
       public          postgres    false    250    4814    238            �           2606    18947    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       public          postgres    false    216    250    4792            �           2606    18967    pedido pedido_id_detalle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_detalle_fkey FOREIGN KEY (id_detalle) REFERENCES public.detallepedido(id_detalle);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_detalle_fkey;
       public          postgres    false    250    4824    248            �           2606    18952 #   pedido pedido_id_estado_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_estado_pedido_fkey FOREIGN KEY (id_estado_pedido) REFERENCES public.estadopedido(id_estado_pedido);
 M   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_estado_pedido_fkey;
       public          postgres    false    218    4794    250            �           2606    18957 &   pedido pedido_id_personal_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_personal_entrega_fkey FOREIGN KEY (id_personal_entrega) REFERENCES public.personalentrega(id_personal_entrega);
 P   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_personal_entrega_fkey;
       public          postgres    false    4820    250    244            �           2606    18864 7   personalentrega personalentrega_id_proceso_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personalentrega
    ADD CONSTRAINT personalentrega_id_proceso_entrega_fkey FOREIGN KEY (id_proceso_entrega) REFERENCES public.procesoentrega(id_proceso_entrega);
 a   ALTER TABLE ONLY public.personalentrega DROP CONSTRAINT personalentrega_id_proceso_entrega_fkey;
       public          postgres    false    244    4798    222            �           2606    18881 *   vehiculo vehiculo_id_personal_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_personal_entrega_fkey FOREIGN KEY (id_personal_entrega) REFERENCES public.personalentrega(id_personal_entrega);
 T   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_id_personal_entrega_fkey;
       public          postgres    false    246    244    4820            �           2606    18876 &   vehiculo vehiculo_id_tipovehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_tipovehiculo_fkey FOREIGN KEY (id_tipovehiculo) REFERENCES public.tipovehiculo(id_tipovehiculo);
 P   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_id_tipovehiculo_fkey;
       public          postgres    false    224    246    4800            �   0   x�3�L-�ON�L�IL�WHIU(�KT(�L�KITHNLK�4����� ��      �   6   x�3��I,�M,JO,�,I,�,�/R�ITHN��IU((��K�,H��4����� |W�      {   4   x�3�t����L�4�42651226�2��M,��w*�/��[�p��qqq &+/      �      x�3�,H,�,I,����� #��      �   $   x�3�4�44�3 � �e�i�ib�g` ���qqq a/�      �      x�3�,HLOL������ 0Y      }      x�3�t�I�J�K)������ -B}      �   -   x�3��4202�50�54�4�2�442	���b���� �T      �      x�3�t�L�ML�г��4�4����� @��            x�3��ML�+I�4�46����� 29      �   `   x�3�4202�50�54�tN-JNTHIU(�S(H,*,M�H�4�A.c�ZC]��MMN��*�M,�L,FRfUf	4�([�_�Y\���iW���� ��      �       x�3�4�4�4202�50�54�4����� 1m�      �   &   x�3�tM)���������WHIUH-.H-J����� ���      �      x�3�L/J�KI����K/�K����� P�W      �      x�3�L�I,�LN����K/�K����� X��      �      x�3�LN,*������ �      �       x�3�,KMO�K�,��M,IU�,����� ``�      �      x�3�t0264�4�4����� ��     