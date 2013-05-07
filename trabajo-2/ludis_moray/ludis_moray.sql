--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: ludis_moray; Type: SCHEMA; Schema: -; Owner: ludis
--

CREATE SCHEMA ludis_moray;


ALTER SCHEMA ludis_moray OWNER TO ludis;

SET search_path = ludis_moray, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auditoria; Type: TABLE; Schema: ludis_moray; Owner: ludis; Tablespace: 
--

CREATE TABLE auditoria (
    id integer NOT NULL,
    usuario character varying(160),
    fecha date,
    operacion character varying(40),
    tabla character varying(160)
);


ALTER TABLE ludis_moray.auditoria OWNER TO ludis;

--
-- Name: auditoria_id_seq; Type: SEQUENCE; Schema: ludis_moray; Owner: ludis
--

CREATE SEQUENCE auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ludis_moray.auditoria_id_seq OWNER TO ludis;

--
-- Name: auditoria_id_seq; Type: SEQUENCE OWNED BY; Schema: ludis_moray; Owner: ludis
--

ALTER SEQUENCE auditoria_id_seq OWNED BY auditoria.id;


--
-- Name: books; Type: TABLE; Schema: ludis_moray; Owner: ludis; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(160)
);


ALTER TABLE ludis_moray.books OWNER TO ludis;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: ludis_moray; Owner: ludis
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ludis_moray.books_id_seq OWNER TO ludis;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: ludis_moray; Owner: ludis
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: loans; Type: TABLE; Schema: ludis_moray; Owner: ludis; Tablespace: 
--

CREATE TABLE loans (
    id integer NOT NULL,
    member_id integer,
    book_id integer
);


ALTER TABLE ludis_moray.loans OWNER TO ludis;

--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: ludis_moray; Owner: ludis
--

CREATE SEQUENCE loans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ludis_moray.loans_id_seq OWNER TO ludis;

--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: ludis_moray; Owner: ludis
--

ALTER SEQUENCE loans_id_seq OWNED BY loans.id;


--
-- Name: members; Type: TABLE; Schema: ludis_moray; Owner: ludis; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    name character varying(160)
);


ALTER TABLE ludis_moray.members OWNER TO ludis;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: ludis_moray; Owner: ludis
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ludis_moray.members_id_seq OWNER TO ludis;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: ludis_moray; Owner: ludis
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: id; Type: DEFAULT; Schema: ludis_moray; Owner: ludis
--

ALTER TABLE ONLY auditoria ALTER COLUMN id SET DEFAULT nextval('auditoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ludis_moray; Owner: ludis
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ludis_moray; Owner: ludis
--

ALTER TABLE ONLY loans ALTER COLUMN id SET DEFAULT nextval('loans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ludis_moray; Owner: ludis
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: auditoria_pkey; Type: CONSTRAINT; Schema: ludis_moray; Owner: ludis; Tablespace: 
--

ALTER TABLE ONLY auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema:ludis_moray; Owner: ludis; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: loans_pkey; Type: CONSTRAINT; Schema: ludis_moray; Owner: ludis; Tablespace: 
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: ludis_moray; Owner:ludis; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: loans_book_id_fkey; Type: FK CONSTRAINT; Schema: ludis_moray; Owner: ludis
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: loans_member_id_fkey; Type: FK CONSTRAINT; Schema: ludis_moray; Owner: ludis
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_member_id_fkey FOREIGN KEY (member_id) REFERENCES members(id);


--
-- PostgreSQL database dump complete
--

