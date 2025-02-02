PGDMP  )                    |            pruebs    16.1    16.1 K    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            n           1262    19446    pruebs    DATABASE     y   CREATE DATABASE pruebs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE pruebs;
                postgres    false            �            1259    19520    barrio    TABLE     �   CREATE TABLE public.barrio (
    id_barrio integer NOT NULL,
    nom_barrio character varying(100),
    descrip_barrio character varying(100),
    id_localidad integer
);
    DROP TABLE public.barrio;
       public         heap    postgres    false            �            1259    19530    calle    TABLE     �   CREATE TABLE public.calle (
    id_calle integer NOT NULL,
    nom_calle character varying(200),
    descrip_calle character varying(300),
    id_barrio integer
);
    DROP TABLE public.calle;
       public         heap    postgres    false            �            1259    19447    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(100),
    telefono_cliente character varying(10)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    19498    complementohamburguesa    TABLE     }   CREATE TABLE public.complementohamburguesa (
    id_complemento integer NOT NULL,
    "añadidura" character varying(150)
);
 *   DROP TABLE public.complementohamburguesa;
       public         heap    postgres    false            �            1259    19594    detallepedido    TABLE     �   CREATE TABLE public.detallepedido (
    id_detalle integer NOT NULL,
    cantidad integer,
    subtotal numeric(10,2),
    id_complemento integer,
    id_hamburguesa integer,
    id_factura integer
);
 !   DROP TABLE public.detallepedido;
       public         heap    postgres    false            �            1259    19481    estadofactura    TABLE     u   CREATE TABLE public.estadofactura (
    id_estado_factura integer NOT NULL,
    estado_fac character varying(150)
);
 !   DROP TABLE public.estadofactura;
       public         heap    postgres    false            �            1259    19452    estadopedido    TABLE     s   CREATE TABLE public.estadopedido (
    id_estado_pedido integer NOT NULL,
    repartidor character varying(100)
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    19584    factura    TABLE     �   CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    numero_factura integer,
    fecha_emision date,
    id_estado_factura integer
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    19557    hamburguesa    TABLE     �   CREATE TABLE public.hamburguesa (
    id_hamburguesa integer NOT NULL,
    nom_hamburguesa character varying(150),
    precio numeric(10,2),
    id_tipoham integer,
    "id_tamañoham" integer
);
    DROP TABLE public.hamburguesa;
       public         heap    postgres    false            �            1259    19464 	   localidad    TABLE     �   CREATE TABLE public.localidad (
    id_localidad integer NOT NULL,
    estado_localidad character varying(100),
    codigo_postal character varying(10)
);
    DROP TABLE public.localidad;
       public         heap    postgres    false            �            1259    19614    pedido    TABLE       CREATE TABLE public.pedido (
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
       public         heap    postgres    false            �            1259    19503    personalentrega    TABLE     �   CREATE TABLE public.personalentrega (
    id_personal_entrega integer NOT NULL,
    numero_carnet character varying(10),
    fecha_vencimiento date,
    id_proceso_entrega integer
);
 #   DROP TABLE public.personalentrega;
       public         heap    postgres    false            �            1259    19469    procesoentrega    TABLE     �   CREATE TABLE public.procesoentrega (
    id_proceso_entrega integer NOT NULL,
    repartidor character varying(100),
    progreso character varying(400)
);
 "   DROP TABLE public.procesoentrega;
       public         heap    postgres    false            �            1259    19486    tamañohamburguesa    TABLE     �   CREATE TABLE public."tamañohamburguesa" (
    "id_tamañoham" integer NOT NULL,
    "nom_tamañoham" character varying(200),
    porcion_extra character varying(250)
);
 (   DROP TABLE public."tamañohamburguesa";
       public         heap    postgres    false            �            1259    19491    tipohamburguesa    TABLE     �   CREATE TABLE public.tipohamburguesa (
    id_tipoham integer NOT NULL,
    nom_tipoham character varying(200),
    descripcion character varying(300)
);
 #   DROP TABLE public.tipohamburguesa;
       public         heap    postgres    false            �            1259    19476    tipovehiculo    TABLE     w   CREATE TABLE public.tipovehiculo (
    id_tipovehiculo integer NOT NULL,
    nombre_vehiculo character varying(100)
);
     DROP TABLE public.tipovehiculo;
       public         heap    postgres    false            �            1259    19572    variedadhamburguesa    TABLE     �   CREATE TABLE public.variedadhamburguesa (
    id_variedadham integer NOT NULL,
    nom_variedadham character varying(250),
    ingredientes character varying(300),
    id_hamburguesa integer
);
 '   DROP TABLE public.variedadhamburguesa;
       public         heap    postgres    false            �            1259    19542    vehiculo    TABLE     �   CREATE TABLE public.vehiculo (
    id_vehiculo integer NOT NULL,
    placa character varying(10),
    id_tipovehiculo integer,
    id_personal_entrega integer
);
    DROP TABLE public.vehiculo;
       public         heap    postgres    false            a          0    19520    barrio 
   TABLE DATA           U   COPY public.barrio (id_barrio, nom_barrio, descrip_barrio, id_localidad) FROM stdin;
    public          postgres    false    225   �_       b          0    19530    calle 
   TABLE DATA           N   COPY public.calle (id_calle, nom_calle, descrip_calle, id_barrio) FROM stdin;
    public          postgres    false    226   `       W          0    19447    cliente 
   TABLE DATA           O   COPY public.cliente (id_cliente, nombre_cliente, telefono_cliente) FROM stdin;
    public          postgres    false    215   `       _          0    19498    complementohamburguesa 
   TABLE DATA           N   COPY public.complementohamburguesa (id_complemento, "añadidura") FROM stdin;
    public          postgres    false    223   <`       g          0    19594    detallepedido 
   TABLE DATA           s   COPY public.detallepedido (id_detalle, cantidad, subtotal, id_complemento, id_hamburguesa, id_factura) FROM stdin;
    public          postgres    false    231   Y`       \          0    19481    estadofactura 
   TABLE DATA           F   COPY public.estadofactura (id_estado_factura, estado_fac) FROM stdin;
    public          postgres    false    220   v`       X          0    19452    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (id_estado_pedido, repartidor) FROM stdin;
    public          postgres    false    216   �`       f          0    19584    factura 
   TABLE DATA           _   COPY public.factura (id_factura, numero_factura, fecha_emision, id_estado_factura) FROM stdin;
    public          postgres    false    230   �`       d          0    19557    hamburguesa 
   TABLE DATA           k   COPY public.hamburguesa (id_hamburguesa, nom_hamburguesa, precio, id_tipoham, "id_tamañoham") FROM stdin;
    public          postgres    false    228   �`       Y          0    19464 	   localidad 
   TABLE DATA           R   COPY public.localidad (id_localidad, estado_localidad, codigo_postal) FROM stdin;
    public          postgres    false    217   �`       h          0    19614    pedido 
   TABLE DATA           �   COPY public.pedido (id_pedido, fecha_pedido, referencia_sitio, id_cliente, id_estado_pedido, id_personal_entrega, id_calle, id_detalle) FROM stdin;
    public          postgres    false    232   a       `          0    19503    personalentrega 
   TABLE DATA           t   COPY public.personalentrega (id_personal_entrega, numero_carnet, fecha_vencimiento, id_proceso_entrega) FROM stdin;
    public          postgres    false    224   $a       Z          0    19469    procesoentrega 
   TABLE DATA           R   COPY public.procesoentrega (id_proceso_entrega, repartidor, progreso) FROM stdin;
    public          postgres    false    218   Aa       ]          0    19486    tamañohamburguesa 
   TABLE DATA           `   COPY public."tamañohamburguesa" ("id_tamañoham", "nom_tamañoham", porcion_extra) FROM stdin;
    public          postgres    false    221   ^a       ^          0    19491    tipohamburguesa 
   TABLE DATA           O   COPY public.tipohamburguesa (id_tipoham, nom_tipoham, descripcion) FROM stdin;
    public          postgres    false    222   {a       [          0    19476    tipovehiculo 
   TABLE DATA           H   COPY public.tipovehiculo (id_tipovehiculo, nombre_vehiculo) FROM stdin;
    public          postgres    false    219   �a       e          0    19572    variedadhamburguesa 
   TABLE DATA           l   COPY public.variedadhamburguesa (id_variedadham, nom_variedadham, ingredientes, id_hamburguesa) FROM stdin;
    public          postgres    false    229   �a       c          0    19542    vehiculo 
   TABLE DATA           \   COPY public.vehiculo (id_vehiculo, placa, id_tipovehiculo, id_personal_entrega) FROM stdin;
    public          postgres    false    227   �a       �           2606    19524    barrio barrio_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.barrio
    ADD CONSTRAINT barrio_pkey PRIMARY KEY (id_barrio);
 <   ALTER TABLE ONLY public.barrio DROP CONSTRAINT barrio_pkey;
       public            postgres    false    225            �           2606    19536    calle calle_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.calle
    ADD CONSTRAINT calle_pkey PRIMARY KEY (id_calle);
 :   ALTER TABLE ONLY public.calle DROP CONSTRAINT calle_pkey;
       public            postgres    false    226            �           2606    19451    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            �           2606    19502 2   complementohamburguesa complementohamburguesa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.complementohamburguesa
    ADD CONSTRAINT complementohamburguesa_pkey PRIMARY KEY (id_complemento);
 \   ALTER TABLE ONLY public.complementohamburguesa DROP CONSTRAINT complementohamburguesa_pkey;
       public            postgres    false    223            �           2606    19598     detallepedido detallepedido_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY (id_detalle);
 J   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    231            �           2606    19485     estadofactura estadofactura_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.estadofactura
    ADD CONSTRAINT estadofactura_pkey PRIMARY KEY (id_estado_factura);
 J   ALTER TABLE ONLY public.estadofactura DROP CONSTRAINT estadofactura_pkey;
       public            postgres    false    220            �           2606    19456    estadopedido estadopedido_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (id_estado_pedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    216            �           2606    19588    factura factura_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    230            �           2606    19561    hamburguesa hamburguesa_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.hamburguesa
    ADD CONSTRAINT hamburguesa_pkey PRIMARY KEY (id_hamburguesa);
 F   ALTER TABLE ONLY public.hamburguesa DROP CONSTRAINT hamburguesa_pkey;
       public            postgres    false    228            �           2606    19468    localidad localidad_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.localidad
    ADD CONSTRAINT localidad_pkey PRIMARY KEY (id_localidad);
 B   ALTER TABLE ONLY public.localidad DROP CONSTRAINT localidad_pkey;
       public            postgres    false    217            �           2606    19618    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    232            �           2606    19507 $   personalentrega personalentrega_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.personalentrega
    ADD CONSTRAINT personalentrega_pkey PRIMARY KEY (id_personal_entrega);
 N   ALTER TABLE ONLY public.personalentrega DROP CONSTRAINT personalentrega_pkey;
       public            postgres    false    224            �           2606    19475 "   procesoentrega procesoentrega_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.procesoentrega
    ADD CONSTRAINT procesoentrega_pkey PRIMARY KEY (id_proceso_entrega);
 L   ALTER TABLE ONLY public.procesoentrega DROP CONSTRAINT procesoentrega_pkey;
       public            postgres    false    218            �           2606    19490 *   tamañohamburguesa tamañohamburguesa_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."tamañohamburguesa"
    ADD CONSTRAINT "tamañohamburguesa_pkey" PRIMARY KEY ("id_tamañoham");
 X   ALTER TABLE ONLY public."tamañohamburguesa" DROP CONSTRAINT "tamañohamburguesa_pkey";
       public            postgres    false    221            �           2606    19497 $   tipohamburguesa tipohamburguesa_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipohamburguesa
    ADD CONSTRAINT tipohamburguesa_pkey PRIMARY KEY (id_tipoham);
 N   ALTER TABLE ONLY public.tipohamburguesa DROP CONSTRAINT tipohamburguesa_pkey;
       public            postgres    false    222            �           2606    19480    tipovehiculo tipovehiculo_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipovehiculo
    ADD CONSTRAINT tipovehiculo_pkey PRIMARY KEY (id_tipovehiculo);
 H   ALTER TABLE ONLY public.tipovehiculo DROP CONSTRAINT tipovehiculo_pkey;
       public            postgres    false    219            �           2606    19578 ,   variedadhamburguesa variedadhamburguesa_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.variedadhamburguesa
    ADD CONSTRAINT variedadhamburguesa_pkey PRIMARY KEY (id_variedadham);
 V   ALTER TABLE ONLY public.variedadhamburguesa DROP CONSTRAINT variedadhamburguesa_pkey;
       public            postgres    false    229            �           2606    19546    vehiculo vehiculo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);
 @   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_pkey;
       public            postgres    false    227            �           2606    19525    barrio barrio_id_localidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.barrio
    ADD CONSTRAINT barrio_id_localidad_fkey FOREIGN KEY (id_localidad) REFERENCES public.localidad(id_localidad);
 I   ALTER TABLE ONLY public.barrio DROP CONSTRAINT barrio_id_localidad_fkey;
       public          postgres    false    217    225    4760            �           2606    19537    calle calle_id_barrio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calle
    ADD CONSTRAINT calle_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES public.barrio(id_barrio);
 D   ALTER TABLE ONLY public.calle DROP CONSTRAINT calle_id_barrio_fkey;
       public          postgres    false    225    226    4776            �           2606    19599 /   detallepedido detallepedido_id_complemento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_id_complemento_fkey FOREIGN KEY (id_complemento) REFERENCES public.complementohamburguesa(id_complemento);
 Y   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_id_complemento_fkey;
       public          postgres    false    231    223    4772            �           2606    19609 +   detallepedido detallepedido_id_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura);
 U   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_id_factura_fkey;
       public          postgres    false    230    231    4786            �           2606    19604 /   detallepedido detallepedido_id_hamburguesa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_id_hamburguesa_fkey FOREIGN KEY (id_hamburguesa) REFERENCES public.hamburguesa(id_hamburguesa);
 Y   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_id_hamburguesa_fkey;
       public          postgres    false    4782    231    228            �           2606    19589 &   factura factura_id_estado_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_estado_factura_fkey FOREIGN KEY (id_estado_factura) REFERENCES public.estadofactura(id_estado_factura);
 P   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_estado_factura_fkey;
       public          postgres    false    4766    220    230            �           2606    19567 *   hamburguesa hamburguesa_id_tamañoham_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hamburguesa
    ADD CONSTRAINT "hamburguesa_id_tamañoham_fkey" FOREIGN KEY ("id_tamañoham") REFERENCES public."tamañohamburguesa"("id_tamañoham");
 V   ALTER TABLE ONLY public.hamburguesa DROP CONSTRAINT "hamburguesa_id_tamañoham_fkey";
       public          postgres    false    4768    228    221            �           2606    19562 '   hamburguesa hamburguesa_id_tipoham_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hamburguesa
    ADD CONSTRAINT hamburguesa_id_tipoham_fkey FOREIGN KEY (id_tipoham) REFERENCES public.tipohamburguesa(id_tipoham);
 Q   ALTER TABLE ONLY public.hamburguesa DROP CONSTRAINT hamburguesa_id_tipoham_fkey;
       public          postgres    false    4770    228    222            �           2606    19634    pedido pedido_id_calle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_calle_fkey FOREIGN KEY (id_calle) REFERENCES public.calle(id_calle);
 E   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_calle_fkey;
       public          postgres    false    4778    226    232            �           2606    19619    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       public          postgres    false    4756    232    215            �           2606    19639    pedido pedido_id_detalle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_detalle_fkey FOREIGN KEY (id_detalle) REFERENCES public.detallepedido(id_detalle);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_detalle_fkey;
       public          postgres    false    232    231    4788            �           2606    19624 #   pedido pedido_id_estado_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_estado_pedido_fkey FOREIGN KEY (id_estado_pedido) REFERENCES public.estadopedido(id_estado_pedido);
 M   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_estado_pedido_fkey;
       public          postgres    false    232    4758    216            �           2606    19629 &   pedido pedido_id_personal_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_personal_entrega_fkey FOREIGN KEY (id_personal_entrega) REFERENCES public.personalentrega(id_personal_entrega);
 P   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_personal_entrega_fkey;
       public          postgres    false    232    4774    224            �           2606    19508 7   personalentrega personalentrega_id_proceso_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personalentrega
    ADD CONSTRAINT personalentrega_id_proceso_entrega_fkey FOREIGN KEY (id_proceso_entrega) REFERENCES public.procesoentrega(id_proceso_entrega);
 a   ALTER TABLE ONLY public.personalentrega DROP CONSTRAINT personalentrega_id_proceso_entrega_fkey;
       public          postgres    false    4762    218    224            �           2606    19579 ;   variedadhamburguesa variedadhamburguesa_id_hamburguesa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.variedadhamburguesa
    ADD CONSTRAINT variedadhamburguesa_id_hamburguesa_fkey FOREIGN KEY (id_hamburguesa) REFERENCES public.hamburguesa(id_hamburguesa);
 e   ALTER TABLE ONLY public.variedadhamburguesa DROP CONSTRAINT variedadhamburguesa_id_hamburguesa_fkey;
       public          postgres    false    229    228    4782            �           2606    19552 *   vehiculo vehiculo_id_personal_entrega_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_personal_entrega_fkey FOREIGN KEY (id_personal_entrega) REFERENCES public.personalentrega(id_personal_entrega);
 T   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_id_personal_entrega_fkey;
       public          postgres    false    224    4774    227            �           2606    19547 &   vehiculo vehiculo_id_tipovehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_tipovehiculo_fkey FOREIGN KEY (id_tipovehiculo) REFERENCES public.tipovehiculo(id_tipovehiculo);
 P   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_id_tipovehiculo_fkey;
       public          postgres    false    227    4764    219            a      x������ � �      b      x������ � �      W      x������ � �      _      x������ � �      g      x������ � �      \      x������ � �      X      x������ � �      f      x������ � �      d      x������ � �      Y      x������ � �      h      x������ � �      `      x������ � �      Z      x������ � �      ]      x������ � �      ^      x������ � �      [      x������ � �      e      x������ � �      c      x������ � �     