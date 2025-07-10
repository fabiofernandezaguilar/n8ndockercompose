--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Homebrew)
-- Dumped by pg_dump version 15.12 (Homebrew)

-- Started on 2025-07-10 04:14:48 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE n8n_db;
--
-- TOC entry 4088 (class 1262 OID 24577)
-- Name: n8n_db; Type: DATABASE; Schema: -; Owner: n8n_user
--

CREATE DATABASE n8n_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE n8n_db OWNER TO n8n_user;

\connect n8n_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 24578)
-- Name: n8n_schema; Type: SCHEMA; Schema: -; Owner: n8n_user
--

CREATE SCHEMA n8n_schema;


ALTER SCHEMA n8n_schema OWNER TO n8n_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 250 (class 1259 OID 25357)
-- Name: annotation_tag_entity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.annotation_tag_entity (
    id character varying(16) NOT NULL,
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.annotation_tag_entity OWNER TO n8n_user;

--
-- TOC entry 235 (class 1259 OID 24884)
-- Name: auth_identity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.auth_identity (
    "userId" uuid,
    "providerId" character varying(64) NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.auth_identity OWNER TO n8n_user;

--
-- TOC entry 237 (class 1259 OID 24897)
-- Name: auth_provider_sync_history; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.auth_provider_sync_history (
    id integer NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "runMode" text NOT NULL,
    status text NOT NULL,
    "startedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    scanned integer NOT NULL,
    created integer NOT NULL,
    updated integer NOT NULL,
    disabled integer NOT NULL,
    error text
);


ALTER TABLE n8n_schema.auth_provider_sync_history OWNER TO n8n_user;

--
-- TOC entry 236 (class 1259 OID 24896)
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

CREATE SEQUENCE n8n_schema.auth_provider_sync_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE n8n_schema.auth_provider_sync_history_id_seq OWNER TO n8n_user;

--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE OWNED BY; Schema: n8n_schema; Owner: n8n_user
--

ALTER SEQUENCE n8n_schema.auth_provider_sync_history_id_seq OWNED BY n8n_schema.auth_provider_sync_history.id;


--
-- TOC entry 222 (class 1259 OID 24600)
-- Name: credentials_entity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.credentials_entity (
    name character varying(128) NOT NULL,
    data text NOT NULL,
    type character varying(128) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL,
    "isManaged" boolean DEFAULT false NOT NULL
);


ALTER TABLE n8n_schema.credentials_entity OWNER TO n8n_user;

--
-- TOC entry 234 (class 1259 OID 24853)
-- Name: event_destinations; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.event_destinations (
    id uuid NOT NULL,
    destination jsonb NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.event_destinations OWNER TO n8n_user;

--
-- TOC entry 251 (class 1259 OID 25365)
-- Name: execution_annotation_tags; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.execution_annotation_tags (
    "annotationId" integer NOT NULL,
    "tagId" character varying(24) NOT NULL
);


ALTER TABLE n8n_schema.execution_annotation_tags OWNER TO n8n_user;

--
-- TOC entry 249 (class 1259 OID 25341)
-- Name: execution_annotations; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.execution_annotations (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    vote character varying(6),
    note text,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.execution_annotations OWNER TO n8n_user;

--
-- TOC entry 248 (class 1259 OID 25340)
-- Name: execution_annotations_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

CREATE SEQUENCE n8n_schema.execution_annotations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE n8n_schema.execution_annotations_id_seq OWNER TO n8n_user;

--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 248
-- Name: execution_annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: n8n_schema; Owner: n8n_user
--

ALTER SEQUENCE n8n_schema.execution_annotations_id_seq OWNED BY n8n_schema.execution_annotations.id;


--
-- TOC entry 239 (class 1259 OID 24992)
-- Name: execution_data; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.execution_data (
    "executionId" integer NOT NULL,
    "workflowData" json NOT NULL,
    data text NOT NULL
);


ALTER TABLE n8n_schema.execution_data OWNER TO n8n_user;

--
-- TOC entry 224 (class 1259 OID 24610)
-- Name: execution_entity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.execution_entity (
    id integer NOT NULL,
    finished boolean NOT NULL,
    mode character varying NOT NULL,
    "retryOf" character varying,
    "retrySuccessId" character varying,
    "startedAt" timestamp(3) with time zone,
    "stoppedAt" timestamp(3) with time zone,
    "waitTill" timestamp(3) with time zone,
    status character varying NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "deletedAt" timestamp(3) with time zone,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.execution_entity OWNER TO n8n_user;

--
-- TOC entry 223 (class 1259 OID 24609)
-- Name: execution_entity_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

CREATE SEQUENCE n8n_schema.execution_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE n8n_schema.execution_entity_id_seq OWNER TO n8n_user;

--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 223
-- Name: execution_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: n8n_schema; Owner: n8n_user
--

ALTER SEQUENCE n8n_schema.execution_entity_id_seq OWNED BY n8n_schema.execution_entity.id;


--
-- TOC entry 246 (class 1259 OID 25316)
-- Name: execution_metadata; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.execution_metadata (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE n8n_schema.execution_metadata OWNER TO n8n_user;

--
-- TOC entry 245 (class 1259 OID 25315)
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

CREATE SEQUENCE n8n_schema.execution_metadata_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE n8n_schema.execution_metadata_temp_id_seq OWNER TO n8n_user;

--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 245
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: n8n_schema; Owner: n8n_user
--

ALTER SEQUENCE n8n_schema.execution_metadata_temp_id_seq OWNED BY n8n_schema.execution_metadata.id;


--
-- TOC entry 254 (class 1259 OID 25509)
-- Name: folder; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.folder (
    id character varying(36) NOT NULL,
    name character varying(128) NOT NULL,
    "parentFolderId" character varying(36),
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.folder OWNER TO n8n_user;

--
-- TOC entry 255 (class 1259 OID 25527)
-- Name: folder_tag; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.folder_tag (
    "folderId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE n8n_schema.folder_tag OWNER TO n8n_user;

--
-- TOC entry 261 (class 1259 OID 25623)
-- Name: insights_by_period; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.insights_by_period (
    id integer NOT NULL,
    "metaId" integer NOT NULL,
    type integer NOT NULL,
    value integer NOT NULL,
    "periodUnit" integer NOT NULL,
    "periodStart" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE n8n_schema.insights_by_period OWNER TO n8n_user;

--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN insights_by_period.type; Type: COMMENT; Schema: n8n_schema; Owner: n8n_user
--

COMMENT ON COLUMN n8n_schema.insights_by_period.type IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN insights_by_period."periodUnit"; Type: COMMENT; Schema: n8n_schema; Owner: n8n_user
--

COMMENT ON COLUMN n8n_schema.insights_by_period."periodUnit" IS '0: hour, 1: day, 2: week';


--
-- TOC entry 260 (class 1259 OID 25622)
-- Name: insights_by_period_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE n8n_schema.insights_by_period ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME n8n_schema.insights_by_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 25594)
-- Name: insights_metadata; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.insights_metadata (
    "metaId" integer NOT NULL,
    "workflowId" character varying(16),
    "projectId" character varying(36),
    "workflowName" character varying(128) NOT NULL,
    "projectName" character varying(255) NOT NULL
);


ALTER TABLE n8n_schema.insights_metadata OWNER TO n8n_user;

--
-- TOC entry 256 (class 1259 OID 25593)
-- Name: insights_metadata_metaId_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE n8n_schema.insights_metadata ALTER COLUMN "metaId" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME n8n_schema."insights_metadata_metaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 25611)
-- Name: insights_raw; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.insights_raw (
    id integer NOT NULL,
    "metaId" integer NOT NULL,
    type integer NOT NULL,
    value integer NOT NULL,
    "timestamp" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE n8n_schema.insights_raw OWNER TO n8n_user;

--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN insights_raw.type; Type: COMMENT; Schema: n8n_schema; Owner: n8n_user
--

COMMENT ON COLUMN n8n_schema.insights_raw.type IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';


--
-- TOC entry 258 (class 1259 OID 25610)
-- Name: insights_raw_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE n8n_schema.insights_raw ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME n8n_schema.insights_raw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 24802)
-- Name: installed_nodes; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.installed_nodes (
    name character varying(200) NOT NULL,
    type character varying(200) NOT NULL,
    "latestVersion" integer DEFAULT 1 NOT NULL,
    package character varying(241) NOT NULL
);


ALTER TABLE n8n_schema.installed_nodes OWNER TO n8n_user;

--
-- TOC entry 231 (class 1259 OID 24795)
-- Name: installed_packages; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.installed_packages (
    "packageName" character varying(214) NOT NULL,
    "installedVersion" character varying(50) NOT NULL,
    "authorName" character varying(70),
    "authorEmail" character varying(70),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.installed_packages OWNER TO n8n_user;

--
-- TOC entry 247 (class 1259 OID 25330)
-- Name: invalid_auth_token; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.invalid_auth_token (
    token character varying(512) NOT NULL,
    "expiresAt" timestamp(3) with time zone NOT NULL
);


ALTER TABLE n8n_schema.invalid_auth_token OWNER TO n8n_user;

--
-- TOC entry 221 (class 1259 OID 24591)
-- Name: migrations; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE n8n_schema.migrations OWNER TO n8n_user;

--
-- TOC entry 220 (class 1259 OID 24590)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: n8n_schema; Owner: n8n_user
--

CREATE SEQUENCE n8n_schema.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE n8n_schema.migrations_id_seq OWNER TO n8n_user;

--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 220
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: n8n_schema; Owner: n8n_user
--

ALTER SEQUENCE n8n_schema.migrations_id_seq OWNED BY n8n_schema.migrations.id;


--
-- TOC entry 253 (class 1259 OID 25398)
-- Name: processed_data; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.processed_data (
    "workflowId" character varying(36) NOT NULL,
    context character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    value text NOT NULL
);


ALTER TABLE n8n_schema.processed_data OWNER TO n8n_user;

--
-- TOC entry 241 (class 1259 OID 25235)
-- Name: project; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.project (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    icon json
);


ALTER TABLE n8n_schema.project OWNER TO n8n_user;

--
-- TOC entry 242 (class 1259 OID 25242)
-- Name: project_relation; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.project_relation (
    "projectId" character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    role character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.project_relation OWNER TO n8n_user;

--
-- TOC entry 230 (class 1259 OID 24787)
-- Name: settings; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.settings (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    "loadOnStartup" boolean DEFAULT false NOT NULL
);


ALTER TABLE n8n_schema.settings OWNER TO n8n_user;

--
-- TOC entry 243 (class 1259 OID 25270)
-- Name: shared_credentials; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.shared_credentials (
    "credentialsId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.shared_credentials OWNER TO n8n_user;

--
-- TOC entry 244 (class 1259 OID 25296)
-- Name: shared_workflow; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.shared_workflow (
    "workflowId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.shared_workflow OWNER TO n8n_user;

--
-- TOC entry 227 (class 1259 OID 24638)
-- Name: tag_entity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.tag_entity (
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL
);


ALTER TABLE n8n_schema.tag_entity OWNER TO n8n_user;

--
-- TOC entry 263 (class 1259 OID 25650)
-- Name: test_case_execution; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.test_case_execution (
    id character varying(36) NOT NULL,
    "testRunId" character varying(36) NOT NULL,
    "executionId" integer,
    status character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    "errorCode" character varying,
    "errorDetails" json,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.test_case_execution OWNER TO n8n_user;

--
-- TOC entry 262 (class 1259 OID 25635)
-- Name: test_run; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.test_run (
    id character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    status character varying NOT NULL,
    "errorCode" character varying,
    "errorDetails" json,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE n8n_schema.test_run OWNER TO n8n_user;

--
-- TOC entry 229 (class 1259 OID 24724)
-- Name: user; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema."user" (
    id uuid DEFAULT uuid_in((OVERLAY(OVERLAY(md5((((random())::text || ':'::text) || (clock_timestamp())::text)) PLACING '4'::text FROM 13) PLACING to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer) FROM 17))::cstring) NOT NULL,
    email character varying(255),
    "firstName" character varying(32),
    "lastName" character varying(32),
    password character varying(255),
    "personalizationAnswers" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    disabled boolean DEFAULT false NOT NULL,
    "mfaEnabled" boolean DEFAULT false NOT NULL,
    "mfaSecret" text,
    "mfaRecoveryCodes" text,
    role text NOT NULL
);


ALTER TABLE n8n_schema."user" OWNER TO n8n_user;

--
-- TOC entry 252 (class 1259 OID 25382)
-- Name: user_api_keys; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.user_api_keys (
    id character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    label character varying(100) NOT NULL,
    "apiKey" character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    scopes json
);


ALTER TABLE n8n_schema.user_api_keys OWNER TO n8n_user;

--
-- TOC entry 238 (class 1259 OID 24908)
-- Name: variables; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.variables (
    key character varying(50) NOT NULL,
    type character varying(50) DEFAULT 'string'::character varying NOT NULL,
    value character varying(255),
    id character varying(36) NOT NULL
);


ALTER TABLE n8n_schema.variables OWNER TO n8n_user;

--
-- TOC entry 226 (class 1259 OID 24628)
-- Name: webhook_entity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.webhook_entity (
    "webhookPath" character varying NOT NULL,
    method character varying NOT NULL,
    node character varying NOT NULL,
    "webhookId" character varying,
    "pathLength" integer,
    "workflowId" character varying(36) NOT NULL
);


ALTER TABLE n8n_schema.webhook_entity OWNER TO n8n_user;

--
-- TOC entry 225 (class 1259 OID 24620)
-- Name: workflow_entity; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.workflow_entity (
    name character varying(128) NOT NULL,
    active boolean NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    "staticData" json,
    "pinData" json,
    "versionId" character(36),
    "triggerCount" integer DEFAULT 0 NOT NULL,
    id character varying(36) NOT NULL,
    meta json,
    "parentFolderId" character varying(36) DEFAULT NULL::character varying,
    "isArchived" boolean DEFAULT false NOT NULL
);


ALTER TABLE n8n_schema.workflow_entity OWNER TO n8n_user;

--
-- TOC entry 240 (class 1259 OID 25006)
-- Name: workflow_history; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.workflow_history (
    "versionId" character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    authors character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL
);


ALTER TABLE n8n_schema.workflow_history OWNER TO n8n_user;

--
-- TOC entry 233 (class 1259 OID 24823)
-- Name: workflow_statistics; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.workflow_statistics (
    count integer DEFAULT 0,
    "latestEvent" timestamp(3) with time zone,
    name character varying(128) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "rootCount" integer DEFAULT 0
);


ALTER TABLE n8n_schema.workflow_statistics OWNER TO n8n_user;

--
-- TOC entry 228 (class 1259 OID 24645)
-- Name: workflows_tags; Type: TABLE; Schema: n8n_schema; Owner: n8n_user
--

CREATE TABLE n8n_schema.workflows_tags (
    "workflowId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE n8n_schema.workflows_tags OWNER TO n8n_user;

--
-- TOC entry 3728 (class 2604 OID 24900)
-- Name: auth_provider_sync_history id; Type: DEFAULT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.auth_provider_sync_history ALTER COLUMN id SET DEFAULT nextval('n8n_schema.auth_provider_sync_history_id_seq'::regclass);


--
-- TOC entry 3743 (class 2604 OID 25344)
-- Name: execution_annotations id; Type: DEFAULT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_annotations ALTER COLUMN id SET DEFAULT nextval('n8n_schema.execution_annotations_id_seq'::regclass);


--
-- TOC entry 3704 (class 2604 OID 24613)
-- Name: execution_entity id; Type: DEFAULT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_entity ALTER COLUMN id SET DEFAULT nextval('n8n_schema.execution_entity_id_seq'::regclass);


--
-- TOC entry 3742 (class 2604 OID 25319)
-- Name: execution_metadata id; Type: DEFAULT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_metadata ALTER COLUMN id SET DEFAULT nextval('n8n_schema.execution_metadata_temp_id_seq'::regclass);


--
-- TOC entry 3700 (class 2604 OID 24594)
-- Name: migrations id; Type: DEFAULT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.migrations ALTER COLUMN id SET DEFAULT nextval('n8n_schema.migrations_id_seq'::regclass);


--
-- TOC entry 4069 (class 0 OID 25357)
-- Dependencies: 250
-- Data for Name: annotation_tag_entity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4054 (class 0 OID 24884)
-- Dependencies: 235
-- Data for Name: auth_identity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4056 (class 0 OID 24897)
-- Dependencies: 237
-- Data for Name: auth_provider_sync_history; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4041 (class 0 OID 24600)
-- Dependencies: 222
-- Data for Name: credentials_entity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.credentials_entity VALUES ('Gmail account', 'U2FsdGVkX194v5YsKn/AfoqoIhz4vGI2WYBQSyEf2G7y5qJ28Cn4+BskFlKlI7x6QbHyLvaakoe9l8X3JFVrQGCIHa1gK5ddc066Gc/GDHIP2ZXtYB40R6tHsrKixFzPze6Y8b8ENCDkbuMSxlDaJt8ywB4QpjLsQi9mm9T/1ZtLn771J1EQPRCPcSPw67jk+iP+dufx2SA05lEISSHRVu8OS8V1T3ecJDkO0FRdXCmKLXqtIv9jWFrtTpho+GsTyXilFk23crDifSdj0fM8V5CpePN082719fqdDqxoqP+uclar1av275lx6TrAhB6Ht2YCEhaqlVHNyjuKy/IuVkL+eDh/djKfQvDivBvlyYsfiKT67u/9CA4Fp4SQlfm+vZLSpBPoM2XpL0Wlv185yQx9CXJtjH+UDCcglOP54koAhzWgbAnGYI74vkT/XZ+Ax3VAdvD0fQY3GxMqJg71HbxxG6V75V2O3EYh5Vfa0frgnL5GzQyTP18W5XXj1xJ8DPECXL5vszAQQm/1hPR7sIi7GdKqhlMASyu+u3TnJgBHy4+nkzzmY2GHJvUV2dfz3a8qjs5c9J0O0iQFeuW8Uux+FWc2U5gyyWyxjYoPqYdR6f5ONudW4MZllfdLUKHXT7ArDelGns1fi4bYrDcqSYqvkEH/yoq8sxKtSwzvDXAYyI6nH1xjKvakjShuas2vYuoqAVs5uNpfryB4TLiZ2gpmDa/4+e397e9PUYmsPUxB3n5alw50CmG2FrkMVbMfx5/45r0pZ918bvLsyuJykRbbL5Qy3883xdH6eCEsmFx0auywtpHe2VGVoudEnbrBhdyF9wCkc0I7mnithh8fyfxY+P7p72dYgOj8p0WJeBYMdWerTtQ/F0gHLtGj57mHtod7aBGniT/yo+wIMwheFv+Me3STgQc1lXNxKz6qWnTdhHag1Ib5v4RRjiIdwGBxvB95DuX6VdmQpEPV6eF4i6UDCQLTazBaKRP2IiCSJhOxyaWZHGA/ZxAHcpTPNwwx81NVUUORofF+NASMGXDG/8JFW8nPrg+dUcLnMlyJTf4eCL3ZkIfX57ZKVbdCpElc4VPOk5Z6pccNUI8RlXVcTd4PgeRt9CVoDFI/18m60upEYrMZClBgNxV4RGyBS+D7reBxjRGR6EJ19d+nhq+5I62u65U6heUKqPovN1W4J3VHuV/A1e1ZNoUcVgPCIP1tu4/0YqG+8OGv+J2Scjvv+42rsHi+Zc9FMIuV/GdZvOryBphWUt9iWyvl3/FLVCcjUQgTmpJ1Zz8y00lRHwOTLD7GiUANSOcw5zVV19e+/k7QBzv0grPe9fkAzS1sd3eU0h/diwjZOLf85scxt1IssBNiiVCO4paYA0MPQBKHGOB0uo99P+6XfwgjXL7mR4c6HWX5eRV2fhSVB/a7VuNhY2DAflptnBLCGByI/XhZodhzWTbqBwC2V+I8aLa2mHRyxvffmXg1SgV2Q565fyBPCUJO/lG4A+JI/2V8AvETXBe472nO3H1WXXqSf5aFcB/exDnoPRTE8YbnOPwLPwEyn290w4W/70Ky7wjy7rK+qHzV5ZiPe73Jt26aTioAHC9xCVeexM/ycUzba8Dbky82os8O+uUkSNNydwVIHASjYQTyQrNcYkuk3rtTKEjhesHjylBDPEnJcO0NdR+gl8wjIi85h+sUO/MnoTS0Ws8hIi2N2EPNvW4P1NGjG/X/uIxoOny01A/wt6KQVNG3g0zJSE+k+9wUj6sMY0bRVkZbxVcqxxFjagsE197zltOHZeFUwk/kF5KEq4AKC1DTzb7jbKrPGUUjp8P6NPll0Bhe5sLTA/LjLX3K94E8R6w1Nnsos435JXn/NUDvoOSU9/lmLnu/MEB6yLiuQ6zMons9FqzKOp/qY32QEU9Ik45aOCkgRAsGggiETb2cFbKS3poNskVxAKFb0N4Xr06hyalBWq8aq+TliNFfhSiwgbkSPOVe3M75xlKnQg8HyidhruKmca0Q79gAibT3IozplnJzX/Oq08ZyQ4nmd/PRrXR66EW/USLDPqWHEOrDBHz/nbI/RxQYtGgoHv6Mnrp6EKbFuk9wCR+pxooXJserYBaJY5G0Vd4zIRP0MMMOSQxvni4MtceW+5JShdZ74dWW2k6WJLVNTvrPxKNE2dxPnHKeSk60q6yV3c86tQ29DVKGUwLLgndH76Yzo02kahFZ1D+3Pc7FiBEwOntnA3FJ+6rznaLszUZmf90SXJIbVypkWacE+HF0Lmqc4UtKnHuig/za0PUfAr9nRjxGSG0J1ZdmSv+UZ5T606j911KuA/Qy0ZQgtvCJduq3duj0sW3f0E7ZBME=', 'gmailOAuth2', '2025-06-04 15:45:07.887-06', '2025-06-04 17:30:14.507-06', 'izDVVOrHZrflYtrH', false);


--
-- TOC entry 4053 (class 0 OID 24853)
-- Dependencies: 234
-- Data for Name: event_destinations; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4070 (class 0 OID 25365)
-- Dependencies: 251
-- Data for Name: execution_annotation_tags; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4068 (class 0 OID 25341)
-- Dependencies: 249
-- Data for Name: execution_annotations; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4058 (class 0 OID 24992)
-- Dependencies: 239
-- Data for Name: execution_data; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.execution_data VALUES (1, '{"id":"O4grqdLqrw7i0QWF","name":"PrimerFlujo","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"9ca08230-6b36-44df-9b83-2d956da56f00","name":"When clicking ‘Execute workflow’"},{"parameters":{"pollTimes":{"item":[{"mode":"everyDay","hour":6,"minute":0},{"mode":"everyDay","hour":17,"minute":0}]},"authentication":"oAuth2","event":"messageReceived","simple":true,"filters":{}},"type":"n8n-nodes-base.gmailTrigger","typeVersion":1.2,"position":[120,120],"id":"6234c6de-bbce-4a25-afd9-96d85c950b34","name":"Gmail Trigger","credentials":{"gmailOAuth2":{"id":"izDVVOrHZrflYtrH","name":"Gmail account"}}}],"connections":{},"settings":{"executionOrder":"v1"},"pinData":{}}', '[{"startData":"1","resultData":"2","executionData":"3"},{"destinationNode":"4","runNodeFilter":"5"},{"runData":"6","pinData":"7"},{"contextData":"8","nodeExecutionStack":"9","metadata":"10","waitingExecution":"11","waitingExecutionSource":"12"},"Gmail Trigger",["4"],{},{},{},[],{},{},{}]');
INSERT INTO n8n_schema.execution_data VALUES (2, '{"id":"O4grqdLqrw7i0QWF","name":"PrimerFlujo","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"9ca08230-6b36-44df-9b83-2d956da56f00","name":"When clicking ‘Execute workflow’"},{"parameters":{"pollTimes":{"item":[{"mode":"everyDay","hour":6,"minute":0},{"mode":"everyDay","hour":17,"minute":0}]},"authentication":"oAuth2","event":"messageReceived","simple":true,"filters":{}},"type":"n8n-nodes-base.gmailTrigger","typeVersion":1.2,"position":[120,120],"id":"6234c6de-bbce-4a25-afd9-96d85c950b34","name":"Gmail Trigger","notesInFlow":true,"credentials":{"gmailOAuth2":{"id":"izDVVOrHZrflYtrH","name":"Gmail account"}}}],"connections":{},"settings":{"executionOrder":"v1"},"pinData":{}}', '[{"startData":"1","resultData":"2","executionData":"3"},{"destinationNode":"4","runNodeFilter":"5"},{"runData":"6","pinData":"7"},{"contextData":"8","nodeExecutionStack":"9","metadata":"10","waitingExecution":"11","waitingExecutionSource":"12"},"Gmail Trigger",["4"],{},{},{},[],{},{},{}]');
INSERT INTO n8n_schema.execution_data VALUES (3, '{"id":"O4grqdLqrw7i0QWF","name":"PrimerFlujo","active":false,"nodes":[{"parameters":{"pollTimes":{"item":[{"mode":"everyDay","hour":6,"minute":0},{"mode":"everyDay","hour":17,"minute":0}]},"authentication":"oAuth2","event":"messageReceived","simple":true,"filters":{}},"type":"n8n-nodes-base.gmailTrigger","typeVersion":1.2,"position":[-160,0],"id":"6234c6de-bbce-4a25-afd9-96d85c950b34","name":"Gmail Trigger","notesInFlow":true,"credentials":{"gmailOAuth2":{"id":"izDVVOrHZrflYtrH","name":"Gmail account"}}},{"parameters":{"authentication":"oAuth2","resource":"message","operation":"get","messageId":"","simple":true},"type":"n8n-nodes-base.gmail","typeVersion":2.1,"position":[60,0],"id":"ec5d2c81-65af-4f6e-88ea-48446657e07b","name":"Gmail","webhookId":"ceca8a2f-48b3-4e06-9d0e-e17b8668408d","notesInFlow":true,"credentials":{"gmailOAuth2":{"id":"izDVVOrHZrflYtrH","name":"Gmail account"}}}],"connections":{"Gmail Trigger":{"main":[[{"node":"Gmail","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}', '[{"resultData":"1"},{"error":"2","runData":"3"},{"level":"4","tags":"5","context":"6","functionality":"7","name":"8","timestamp":1749077054963,"message":"9","stack":"10"},{},"warning",{},{},"regular","WorkflowHasIssuesError","The workflow has issues and cannot be executed for that reason. Please fix them first.","WorkflowHasIssuesError: The workflow has issues and cannot be executed for that reason. Please fix them first.\n    at WorkflowExecute.processRunExecutionData (/usr/local/lib/node_modules/n8n/node_modules/.pnpm/n8n-core@file+packages+core_openai@4.78.1_encoding@0.1.13_zod@3.24.1_/node_modules/n8n-core/src/execution-engine/workflow-execute.ts:1330:10)\n    at WorkflowExecute.runPartialWorkflow2 (/usr/local/lib/node_modules/n8n/node_modules/.pnpm/n8n-core@file+packages+core_openai@4.78.1_encoding@0.1.13_zod@3.24.1_/node_modules/n8n-core/src/execution-engine/workflow-execute.ts:471:15)\n    at ManualExecutionService.runManually (/usr/local/lib/node_modules/n8n/src/manual-execution.service.ts:171:28)\n    at WorkflowRunner.runMainProcess (/usr/local/lib/node_modules/n8n/src/workflow-runner.ts:284:53)\n    at processTicksAndRejections (node:internal/process/task_queues:95:5)\n    at WorkflowRunner.run (/usr/local/lib/node_modules/n8n/src/workflow-runner.ts:171:4)\n    at WorkflowExecutionService.executeManually (/usr/local/lib/node_modules/n8n/src/workflows/workflow-execution.service.ts:224:23)\n    at WorkflowsController.runManually (/usr/local/lib/node_modules/n8n/src/workflows/workflows.controller.ts:469:10)\n    at handler (/usr/local/lib/node_modules/n8n/src/controller.registry.ts:74:12)\n    at /usr/local/lib/node_modules/n8n/src/response-helper.ts:157:17"]');


--
-- TOC entry 4043 (class 0 OID 24610)
-- Dependencies: 224
-- Data for Name: execution_entity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.execution_entity VALUES (1, true, 'manual', NULL, NULL, '2025-06-04 16:40:26.959-06', '2025-06-04 16:40:26.979-06', NULL, 'success', 'O4grqdLqrw7i0QWF', NULL, '2025-06-04 16:40:26.528-06');
INSERT INTO n8n_schema.execution_entity VALUES (2, true, 'manual', NULL, NULL, '2025-06-04 16:40:43.007-06', '2025-06-04 16:40:43.023-06', NULL, 'success', 'O4grqdLqrw7i0QWF', NULL, '2025-06-04 16:40:42.993-06');
INSERT INTO n8n_schema.execution_entity VALUES (3, false, 'manual', NULL, NULL, '2025-06-04 16:44:14.947-06', '2025-06-04 16:44:15.042-06', NULL, 'error', 'O4grqdLqrw7i0QWF', NULL, '2025-06-04 16:44:14.423-06');


--
-- TOC entry 4065 (class 0 OID 25316)
-- Dependencies: 246
-- Data for Name: execution_metadata; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4073 (class 0 OID 25509)
-- Dependencies: 254
-- Data for Name: folder; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4074 (class 0 OID 25527)
-- Dependencies: 255
-- Data for Name: folder_tag; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4080 (class 0 OID 25623)
-- Dependencies: 261
-- Data for Name: insights_by_period; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4076 (class 0 OID 25594)
-- Dependencies: 257
-- Data for Name: insights_metadata; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4078 (class 0 OID 25611)
-- Dependencies: 259
-- Data for Name: insights_raw; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4051 (class 0 OID 24802)
-- Dependencies: 232
-- Data for Name: installed_nodes; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4050 (class 0 OID 24795)
-- Dependencies: 231
-- Data for Name: installed_packages; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4066 (class 0 OID 25330)
-- Dependencies: 247
-- Data for Name: invalid_auth_token; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4040 (class 0 OID 24591)
-- Dependencies: 221
-- Data for Name: migrations; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.migrations VALUES (1, 1587669153312, 'InitialMigration1587669153312');
INSERT INTO n8n_schema.migrations VALUES (2, 1589476000887, 'WebhookModel1589476000887');
INSERT INTO n8n_schema.migrations VALUES (3, 1594828256133, 'CreateIndexStoppedAt1594828256133');
INSERT INTO n8n_schema.migrations VALUES (4, 1607431743768, 'MakeStoppedAtNullable1607431743768');
INSERT INTO n8n_schema.migrations VALUES (5, 1611144599516, 'AddWebhookId1611144599516');
INSERT INTO n8n_schema.migrations VALUES (6, 1617270242566, 'CreateTagEntity1617270242566');
INSERT INTO n8n_schema.migrations VALUES (7, 1620824779533, 'UniqueWorkflowNames1620824779533');
INSERT INTO n8n_schema.migrations VALUES (8, 1626176912946, 'AddwaitTill1626176912946');
INSERT INTO n8n_schema.migrations VALUES (9, 1630419189837, 'UpdateWorkflowCredentials1630419189837');
INSERT INTO n8n_schema.migrations VALUES (10, 1644422880309, 'AddExecutionEntityIndexes1644422880309');
INSERT INTO n8n_schema.migrations VALUES (11, 1646834195327, 'IncreaseTypeVarcharLimit1646834195327');
INSERT INTO n8n_schema.migrations VALUES (12, 1646992772331, 'CreateUserManagement1646992772331');
INSERT INTO n8n_schema.migrations VALUES (13, 1648740597343, 'LowerCaseUserEmail1648740597343');
INSERT INTO n8n_schema.migrations VALUES (14, 1652254514002, 'CommunityNodes1652254514002');
INSERT INTO n8n_schema.migrations VALUES (15, 1652367743993, 'AddUserSettings1652367743993');
INSERT INTO n8n_schema.migrations VALUES (16, 1652905585850, 'AddAPIKeyColumn1652905585850');
INSERT INTO n8n_schema.migrations VALUES (17, 1654090467022, 'IntroducePinData1654090467022');
INSERT INTO n8n_schema.migrations VALUES (18, 1658932090381, 'AddNodeIds1658932090381');
INSERT INTO n8n_schema.migrations VALUES (19, 1659902242948, 'AddJsonKeyPinData1659902242948');
INSERT INTO n8n_schema.migrations VALUES (20, 1660062385367, 'CreateCredentialsUserRole1660062385367');
INSERT INTO n8n_schema.migrations VALUES (21, 1663755770893, 'CreateWorkflowsEditorRole1663755770893');
INSERT INTO n8n_schema.migrations VALUES (22, 1664196174001, 'WorkflowStatistics1664196174001');
INSERT INTO n8n_schema.migrations VALUES (23, 1665484192212, 'CreateCredentialUsageTable1665484192212');
INSERT INTO n8n_schema.migrations VALUES (24, 1665754637025, 'RemoveCredentialUsageTable1665754637025');
INSERT INTO n8n_schema.migrations VALUES (25, 1669739707126, 'AddWorkflowVersionIdColumn1669739707126');
INSERT INTO n8n_schema.migrations VALUES (26, 1669823906995, 'AddTriggerCountColumn1669823906995');
INSERT INTO n8n_schema.migrations VALUES (27, 1671535397530, 'MessageEventBusDestinations1671535397530');
INSERT INTO n8n_schema.migrations VALUES (28, 1671726148421, 'RemoveWorkflowDataLoadedFlag1671726148421');
INSERT INTO n8n_schema.migrations VALUES (29, 1673268682475, 'DeleteExecutionsWithWorkflows1673268682475');
INSERT INTO n8n_schema.migrations VALUES (30, 1674138566000, 'AddStatusToExecutions1674138566000');
INSERT INTO n8n_schema.migrations VALUES (31, 1674509946020, 'CreateLdapEntities1674509946020');
INSERT INTO n8n_schema.migrations VALUES (32, 1675940580449, 'PurgeInvalidWorkflowConnections1675940580449');
INSERT INTO n8n_schema.migrations VALUES (33, 1676996103000, 'MigrateExecutionStatus1676996103000');
INSERT INTO n8n_schema.migrations VALUES (34, 1677236854063, 'UpdateRunningExecutionStatus1677236854063');
INSERT INTO n8n_schema.migrations VALUES (35, 1677501636754, 'CreateVariables1677501636754');
INSERT INTO n8n_schema.migrations VALUES (36, 1679416281778, 'CreateExecutionMetadataTable1679416281778');
INSERT INTO n8n_schema.migrations VALUES (37, 1681134145996, 'AddUserActivatedProperty1681134145996');
INSERT INTO n8n_schema.migrations VALUES (38, 1681134145997, 'RemoveSkipOwnerSetup1681134145997');
INSERT INTO n8n_schema.migrations VALUES (39, 1690000000000, 'MigrateIntegerKeysToString1690000000000');
INSERT INTO n8n_schema.migrations VALUES (40, 1690000000020, 'SeparateExecutionData1690000000020');
INSERT INTO n8n_schema.migrations VALUES (41, 1690000000030, 'RemoveResetPasswordColumns1690000000030');
INSERT INTO n8n_schema.migrations VALUES (42, 1690000000030, 'AddMfaColumns1690000000030');
INSERT INTO n8n_schema.migrations VALUES (43, 1690787606731, 'AddMissingPrimaryKeyOnExecutionData1690787606731');
INSERT INTO n8n_schema.migrations VALUES (44, 1691088862123, 'CreateWorkflowNameIndex1691088862123');
INSERT INTO n8n_schema.migrations VALUES (45, 1692967111175, 'CreateWorkflowHistoryTable1692967111175');
INSERT INTO n8n_schema.migrations VALUES (46, 1693491613982, 'ExecutionSoftDelete1693491613982');
INSERT INTO n8n_schema.migrations VALUES (47, 1693554410387, 'DisallowOrphanExecutions1693554410387');
INSERT INTO n8n_schema.migrations VALUES (48, 1694091729095, 'MigrateToTimestampTz1694091729095');
INSERT INTO n8n_schema.migrations VALUES (49, 1695128658538, 'AddWorkflowMetadata1695128658538');
INSERT INTO n8n_schema.migrations VALUES (50, 1695829275184, 'ModifyWorkflowHistoryNodesAndConnections1695829275184');
INSERT INTO n8n_schema.migrations VALUES (51, 1700571993961, 'AddGlobalAdminRole1700571993961');
INSERT INTO n8n_schema.migrations VALUES (52, 1705429061930, 'DropRoleMapping1705429061930');
INSERT INTO n8n_schema.migrations VALUES (53, 1711018413374, 'RemoveFailedExecutionStatus1711018413374');
INSERT INTO n8n_schema.migrations VALUES (54, 1711390882123, 'MoveSshKeysToDatabase1711390882123');
INSERT INTO n8n_schema.migrations VALUES (55, 1712044305787, 'RemoveNodesAccess1712044305787');
INSERT INTO n8n_schema.migrations VALUES (56, 1714133768519, 'CreateProject1714133768519');
INSERT INTO n8n_schema.migrations VALUES (57, 1714133768521, 'MakeExecutionStatusNonNullable1714133768521');
INSERT INTO n8n_schema.migrations VALUES (58, 1717498465931, 'AddActivatedAtUserSetting1717498465931');
INSERT INTO n8n_schema.migrations VALUES (59, 1720101653148, 'AddConstraintToExecutionMetadata1720101653148');
INSERT INTO n8n_schema.migrations VALUES (60, 1721377157740, 'FixExecutionMetadataSequence1721377157740');
INSERT INTO n8n_schema.migrations VALUES (61, 1723627610222, 'CreateInvalidAuthTokenTable1723627610222');
INSERT INTO n8n_schema.migrations VALUES (62, 1723796243146, 'RefactorExecutionIndices1723796243146');
INSERT INTO n8n_schema.migrations VALUES (63, 1724753530828, 'CreateAnnotationTables1724753530828');
INSERT INTO n8n_schema.migrations VALUES (64, 1724951148974, 'AddApiKeysTable1724951148974');
INSERT INTO n8n_schema.migrations VALUES (65, 1726606152711, 'CreateProcessedDataTable1726606152711');
INSERT INTO n8n_schema.migrations VALUES (66, 1727427440136, 'SeparateExecutionCreationFromStart1727427440136');
INSERT INTO n8n_schema.migrations VALUES (67, 1728659839644, 'AddMissingPrimaryKeyOnAnnotationTagMapping1728659839644');
INSERT INTO n8n_schema.migrations VALUES (68, 1729607673464, 'UpdateProcessedDataValueColumnToText1729607673464');
INSERT INTO n8n_schema.migrations VALUES (69, 1729607673469, 'AddProjectIcons1729607673469');
INSERT INTO n8n_schema.migrations VALUES (70, 1730386903556, 'CreateTestDefinitionTable1730386903556');
INSERT INTO n8n_schema.migrations VALUES (71, 1731404028106, 'AddDescriptionToTestDefinition1731404028106');
INSERT INTO n8n_schema.migrations VALUES (72, 1731582748663, 'MigrateTestDefinitionKeyToString1731582748663');
INSERT INTO n8n_schema.migrations VALUES (73, 1732271325258, 'CreateTestMetricTable1732271325258');
INSERT INTO n8n_schema.migrations VALUES (74, 1732549866705, 'CreateTestRun1732549866705');
INSERT INTO n8n_schema.migrations VALUES (75, 1733133775640, 'AddMockedNodesColumnToTestDefinition1733133775640');
INSERT INTO n8n_schema.migrations VALUES (76, 1734479635324, 'AddManagedColumnToCredentialsTable1734479635324');
INSERT INTO n8n_schema.migrations VALUES (77, 1736172058779, 'AddStatsColumnsToTestRun1736172058779');
INSERT INTO n8n_schema.migrations VALUES (78, 1736947513045, 'CreateTestCaseExecutionTable1736947513045');
INSERT INTO n8n_schema.migrations VALUES (79, 1737715421462, 'AddErrorColumnsToTestRuns1737715421462');
INSERT INTO n8n_schema.migrations VALUES (80, 1738709609940, 'CreateFolderTable1738709609940');
INSERT INTO n8n_schema.migrations VALUES (81, 1739549398681, 'CreateAnalyticsTables1739549398681');
INSERT INTO n8n_schema.migrations VALUES (82, 1740445074052, 'UpdateParentFolderIdColumn1740445074052');
INSERT INTO n8n_schema.migrations VALUES (83, 1741167584277, 'RenameAnalyticsToInsights1741167584277');
INSERT INTO n8n_schema.migrations VALUES (84, 1742918400000, 'AddScopesColumnToApiKeys1742918400000');
INSERT INTO n8n_schema.migrations VALUES (85, 1745322634000, 'ClearEvaluation1745322634000');
INSERT INTO n8n_schema.migrations VALUES (86, 1745587087521, 'AddWorkflowStatisticsRootCount1745587087521');
INSERT INTO n8n_schema.migrations VALUES (87, 1745934666076, 'AddWorkflowArchivedColumn1745934666076');
INSERT INTO n8n_schema.migrations VALUES (88, 1745934666077, 'DropRoleTable1745934666077');


--
-- TOC entry 4072 (class 0 OID 25398)
-- Dependencies: 253
-- Data for Name: processed_data; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4060 (class 0 OID 25235)
-- Dependencies: 241
-- Data for Name: project; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.project VALUES ('UEEPqvcZAUKMBwJ6', 'Fabio Fernández <fabio.fernandez@datastrategys.com>', 'personal', '2025-06-03 23:09:09.114-06', '2025-06-03 23:15:22.932-06', NULL);


--
-- TOC entry 4061 (class 0 OID 25242)
-- Dependencies: 242
-- Data for Name: project_relation; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.project_relation VALUES ('UEEPqvcZAUKMBwJ6', 'dac80f4a-ccfb-404b-a978-a2e460fcb100', 'project:personalOwner', '2025-06-03 23:09:09.114-06', '2025-06-03 23:09:09.114-06');


--
-- TOC entry 4049 (class 0 OID 24787)
-- Dependencies: 230
-- Data for Name: settings; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.settings VALUES ('ui.banners.dismissed', '["V1"]', true);
INSERT INTO n8n_schema.settings VALUES ('features.ldap', '{"loginEnabled":false,"loginLabel":"","connectionUrl":"","allowUnauthorizedCerts":false,"connectionSecurity":"none","connectionPort":389,"baseDn":"","bindingAdminDn":"","bindingAdminPassword":"","firstNameAttribute":"","lastNameAttribute":"","emailAttribute":"","loginIdAttribute":"","ldapIdAttribute":"","userFilter":"","synchronizationEnabled":false,"synchronizationInterval":60,"searchPageSize":0,"searchTimeout":60}', true);
INSERT INTO n8n_schema.settings VALUES ('features.sourceControl.sshKeys', '{"encryptedPrivateKey":"U2FsdGVkX1+m2K3FkyYqB9n07FUYxTof4X7V4+g1vyW3POf5P8nWQx6aHdxa7HWslOTar+OeC6vwdJ6WGtyebF7sdjBUyjEJafAOduqOpvxk0bf62urL2zjciofJdMWAU/YjNJ6S6oLIbFyjqYvI3DQTrOfXZc7UjTi/4TV4TNkkhTJGS5cB95FuRBZSQY4rLZzR4oYBqADB6W1DeTYlqxI7jV93Wag+E4QVhjqRXp6mnlnl+cU+eGVNaYKV6vFMgyn/9D8lAApIxXETgeB+rGC5MX7odlmPIP58I4Rk46UMa7UPMWefa57ru9z/8W6qgByCaM/s9tS2sCYIF5W7Ry4DCgI2lth+b50a7l3qZgAh/qJl0B1a/lduhcsE9pdaQHghDQbwdQMSLhmCqu4zXAzTydlJ0co93cUzHQzmOwi7c3QuaeMe3t8n6+VSz5d3hLs1YGTmRQwHgB/Ht6onfne9JK2ZgFMGcyH45gGyGgAeBQTnwM1UJ/+wzExgCF8m//Q7p0cVrhFPnyAEYE6p8y3QlUKhwOmUVU5NddZBPb8JWNzEvd8R6OZrxHV3vYMC","publicKey":"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRJoLOeLmAZICsuG4aVlgTdUd3wiqgl8uZ2mxRX/9Nf n8n deploy key"}', true);
INSERT INTO n8n_schema.settings VALUES ('features.sourceControl', '{"branchName":"main","keyGeneratorType":"ed25519"}', true);
INSERT INTO n8n_schema.settings VALUES ('userManagement.isInstanceOwnerSetUp', 'true', true);


--
-- TOC entry 4062 (class 0 OID 25270)
-- Dependencies: 243
-- Data for Name: shared_credentials; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.shared_credentials VALUES ('izDVVOrHZrflYtrH', 'UEEPqvcZAUKMBwJ6', 'credential:owner', '2025-06-04 15:45:07.887-06', '2025-06-04 15:45:07.887-06');


--
-- TOC entry 4063 (class 0 OID 25296)
-- Dependencies: 244
-- Data for Name: shared_workflow; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.shared_workflow VALUES ('BgQjPen7NFI85Hi5', 'UEEPqvcZAUKMBwJ6', 'workflow:owner', '2025-06-03 23:18:19.973-06', '2025-06-03 23:18:19.973-06');
INSERT INTO n8n_schema.shared_workflow VALUES ('O4grqdLqrw7i0QWF', 'UEEPqvcZAUKMBwJ6', 'workflow:owner', '2025-06-03 23:40:20.422-06', '2025-06-03 23:40:20.422-06');


--
-- TOC entry 4046 (class 0 OID 24638)
-- Dependencies: 227
-- Data for Name: tag_entity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4082 (class 0 OID 25650)
-- Dependencies: 263
-- Data for Name: test_case_execution; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4081 (class 0 OID 25635)
-- Dependencies: 262
-- Data for Name: test_run; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4048 (class 0 OID 24724)
-- Dependencies: 229
-- Data for Name: user; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema."user" VALUES ('dac80f4a-ccfb-404b-a978-a2e460fcb100', 'fabio.fernandez@datastrategys.com', 'Fabio', 'Fernández', '$2a$10$gRp1zs1QuvUiRYGqqvuNDuN7JX/TaNMg2XQ.z2atpaQSK2ZW.n2Pi', NULL, '2025-06-03 23:09:06.314-06', '2025-06-03 23:15:22.902-06', '{"userActivated": false}', false, false, NULL, NULL, 'global:owner');


--
-- TOC entry 4071 (class 0 OID 25382)
-- Dependencies: 252
-- Data for Name: user_api_keys; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4057 (class 0 OID 24908)
-- Dependencies: 238
-- Data for Name: variables; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4045 (class 0 OID 24628)
-- Dependencies: 226
-- Data for Name: webhook_entity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4044 (class 0 OID 24620)
-- Dependencies: 225
-- Data for Name: workflow_entity; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.workflow_entity VALUES ('My workflow', false, '[]', '{}', '2025-06-03 23:18:19.973-06', '2025-06-03 23:18:19.973-06', '{"executionOrder":"v1"}', NULL, '{}', '001c2955-ff40-4be0-892a-7f1ac2ab149d', 0, 'BgQjPen7NFI85Hi5', NULL, NULL, false);
INSERT INTO n8n_schema.workflow_entity VALUES ('PrimerFlujo', false, '[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"9ca08230-6b36-44df-9b83-2d956da56f00","name":"When clicking ‘Execute workflow’"}]', '{}', '2025-06-03 23:40:20.422-06', '2025-06-03 23:40:20.422-06', '{"executionOrder":"v1"}', NULL, '{}', 'b5d52265-5845-4b9b-9121-4c95fece0a90', 0, 'O4grqdLqrw7i0QWF', NULL, NULL, false);


--
-- TOC entry 4059 (class 0 OID 25006)
-- Dependencies: 240
-- Data for Name: workflow_history; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4052 (class 0 OID 24823)
-- Dependencies: 233
-- Data for Name: workflow_statistics; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--

INSERT INTO n8n_schema.workflow_statistics VALUES (2, '2025-06-04 16:40:43.815-06', 'manual_success', 'O4grqdLqrw7i0QWF', 0);
INSERT INTO n8n_schema.workflow_statistics VALUES (1, '2025-06-04 16:44:16.217-06', 'manual_error', 'O4grqdLqrw7i0QWF', 0);


--
-- TOC entry 4047 (class 0 OID 24645)
-- Dependencies: 228
-- Data for Name: workflows_tags; Type: TABLE DATA; Schema: n8n_schema; Owner: n8n_user
--



--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.auth_provider_sync_history_id_seq', 1, false);


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 248
-- Name: execution_annotations_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.execution_annotations_id_seq', 1, false);


--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 223
-- Name: execution_entity_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.execution_entity_id_seq', 3, true);


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 245
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.execution_metadata_temp_id_seq', 1, false);


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 260
-- Name: insights_by_period_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.insights_by_period_id_seq', 1, false);


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 256
-- Name: insights_metadata_metaId_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema."insights_metadata_metaId_seq"', 1, false);


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 258
-- Name: insights_raw_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.insights_raw_id_seq', 1, false);


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 220
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: n8n_schema; Owner: n8n_user
--

SELECT pg_catalog.setval('n8n_schema.migrations_id_seq', 88, true);


--
-- TOC entry 3860 (class 2606 OID 25643)
-- Name: test_run PK_011c050f566e9db509a0fadb9b9; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.test_run
    ADD CONSTRAINT "PK_011c050f566e9db509a0fadb9b9" PRIMARY KEY (id);


--
-- TOC entry 3793 (class 2606 OID 24801)
-- Name: installed_packages PK_08cc9197c39b028c1e9beca225940576fd1a5804; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.installed_packages
    ADD CONSTRAINT "PK_08cc9197c39b028c1e9beca225940576fd1a5804" PRIMARY KEY ("packageName");


--
-- TOC entry 3826 (class 2606 OID 25323)
-- Name: execution_metadata PK_17a0b6284f8d626aae88e1c16e4; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_metadata
    ADD CONSTRAINT "PK_17a0b6284f8d626aae88e1c16e4" PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 25250)
-- Name: project_relation PK_1caaa312a5d7184a003be0f0cb6; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.project_relation
    ADD CONSTRAINT "PK_1caaa312a5d7184a003be0f0cb6" PRIMARY KEY ("projectId", "userId");


--
-- TOC entry 3849 (class 2606 OID 25531)
-- Name: folder_tag PK_27e4e00852f6b06a925a4d83a3e; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.folder_tag
    ADD CONSTRAINT "PK_27e4e00852f6b06a925a4d83a3e" PRIMARY KEY ("folderId", "tagId");


--
-- TOC entry 3815 (class 2606 OID 25241)
-- Name: project PK_4d68b1358bb5b766d3e78f32f57; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.project
    ADD CONSTRAINT "PK_4d68b1358bb5b766d3e78f32f57" PRIMARY KEY (id);


--
-- TOC entry 3828 (class 2606 OID 25336)
-- Name: invalid_auth_token PK_5779069b7235b256d91f7af1a15; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.invalid_auth_token
    ADD CONSTRAINT "PK_5779069b7235b256d91f7af1a15" PRIMARY KEY (token);


--
-- TOC entry 3823 (class 2606 OID 25304)
-- Name: shared_workflow PK_5ba87620386b847201c9531c58f; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.shared_workflow
    ADD CONSTRAINT "PK_5ba87620386b847201c9531c58f" PRIMARY KEY ("workflowId", "projectId");


--
-- TOC entry 3847 (class 2606 OID 25515)
-- Name: folder PK_6278a41a706740c94c02e288df8; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.folder
    ADD CONSTRAINT "PK_6278a41a706740c94c02e288df8" PRIMARY KEY (id);


--
-- TOC entry 3834 (class 2606 OID 25363)
-- Name: annotation_tag_entity PK_69dfa041592c30bbc0d4b84aa00; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.annotation_tag_entity
    ADD CONSTRAINT "PK_69dfa041592c30bbc0d4b84aa00" PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 25350)
-- Name: execution_annotations PK_7afcf93ffa20c4252869a7c6a23; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_annotations
    ADD CONSTRAINT "PK_7afcf93ffa20c4252869a7c6a23" PRIMARY KEY (id);


--
-- TOC entry 3761 (class 2606 OID 24598)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- TOC entry 3795 (class 2606 OID 24809)
-- Name: installed_nodes PK_8ebd28194e4f792f96b5933423fc439df97d9689; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.installed_nodes
    ADD CONSTRAINT "PK_8ebd28194e4f792f96b5933423fc439df97d9689" PRIMARY KEY (name);


--
-- TOC entry 3821 (class 2606 OID 25278)
-- Name: shared_credentials PK_8ef3a59796a228913f251779cff; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.shared_credentials
    ADD CONSTRAINT "PK_8ef3a59796a228913f251779cff" PRIMARY KEY ("credentialsId", "projectId");


--
-- TOC entry 3863 (class 2606 OID 25658)
-- Name: test_case_execution PK_90c121f77a78a6580e94b794bce; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.test_case_execution
    ADD CONSTRAINT "PK_90c121f77a78a6580e94b794bce" PRIMARY KEY (id);


--
-- TOC entry 3842 (class 2606 OID 25390)
-- Name: user_api_keys PK_978fa5caa3468f463dac9d92e69; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.user_api_keys
    ADD CONSTRAINT "PK_978fa5caa3468f463dac9d92e69" PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 25369)
-- Name: execution_annotation_tags PK_979ec03d31294cca484be65d11f; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_annotation_tags
    ADD CONSTRAINT "PK_979ec03d31294cca484be65d11f" PRIMARY KEY ("annotationId", "tagId");


--
-- TOC entry 3777 (class 2606 OID 24634)
-- Name: webhook_entity PK_b21ace2e13596ccd87dc9bf4ea6; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.webhook_entity
    ADD CONSTRAINT "PK_b21ace2e13596ccd87dc9bf4ea6" PRIMARY KEY ("webhookPath", method);


--
-- TOC entry 3857 (class 2606 OID 25628)
-- Name: insights_by_period PK_b606942249b90cc39b0265f0575; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_by_period
    ADD CONSTRAINT "PK_b606942249b90cc39b0265f0575" PRIMARY KEY (id);


--
-- TOC entry 3813 (class 2606 OID 25014)
-- Name: workflow_history PK_b6572dd6173e4cd06fe79937b58; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflow_history
    ADD CONSTRAINT "PK_b6572dd6173e4cd06fe79937b58" PRIMARY KEY ("versionId");


--
-- TOC entry 3844 (class 2606 OID 25406)
-- Name: processed_data PK_ca04b9d8dc72de268fe07a65773; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.processed_data
    ADD CONSTRAINT "PK_ca04b9d8dc72de268fe07a65773" PRIMARY KEY ("workflowId", context);


--
-- TOC entry 3791 (class 2606 OID 24794)
-- Name: settings PK_dc0fe14e6d9943f268e7b119f69ab8bd; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.settings
    ADD CONSTRAINT "PK_dc0fe14e6d9943f268e7b119f69ab8bd" PRIMARY KEY (key);


--
-- TOC entry 3787 (class 2606 OID 24733)
-- Name: user PK_ea8f538c94b6e352418254ed6474a81f; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema."user"
    ADD CONSTRAINT "PK_ea8f538c94b6e352418254ed6474a81f" PRIMARY KEY (id);


--
-- TOC entry 3854 (class 2606 OID 25616)
-- Name: insights_raw PK_ec15125755151e3a7e00e00014f; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_raw
    ADD CONSTRAINT "PK_ec15125755151e3a7e00e00014f" PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 25598)
-- Name: insights_metadata PK_f448a94c35218b6208ce20cf5a1; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_metadata
    ADD CONSTRAINT "PK_f448a94c35218b6208ce20cf5a1" PRIMARY KEY ("metaId");


--
-- TOC entry 3789 (class 2606 OID 24735)
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e2; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e2" UNIQUE (email);


--
-- TOC entry 3801 (class 2606 OID 24890)
-- Name: auth_identity auth_identity_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.auth_identity
    ADD CONSTRAINT auth_identity_pkey PRIMARY KEY ("providerId", "providerType");


--
-- TOC entry 3803 (class 2606 OID 24906)
-- Name: auth_provider_sync_history auth_provider_sync_history_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.auth_provider_sync_history
    ADD CONSTRAINT auth_provider_sync_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3763 (class 2606 OID 24988)
-- Name: credentials_entity credentials_entity_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.credentials_entity
    ADD CONSTRAINT credentials_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 24861)
-- Name: event_destinations event_destinations_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.event_destinations
    ADD CONSTRAINT event_destinations_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 25004)
-- Name: execution_data execution_data_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_data
    ADD CONSTRAINT execution_data_pkey PRIMARY KEY ("executionId");


--
-- TOC entry 3771 (class 2606 OID 24617)
-- Name: execution_entity pk_e3e63bbf986767844bbe1166d4e; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_entity
    ADD CONSTRAINT pk_e3e63bbf986767844bbe1166d4e PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 24957)
-- Name: workflow_statistics pk_workflow_statistics; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflow_statistics
    ADD CONSTRAINT pk_workflow_statistics PRIMARY KEY ("workflowId", name);


--
-- TOC entry 3785 (class 2606 OID 24936)
-- Name: workflows_tags pk_workflows_tags; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflows_tags
    ADD CONSTRAINT pk_workflows_tags PRIMARY KEY ("workflowId", "tagId");


--
-- TOC entry 3782 (class 2606 OID 24977)
-- Name: tag_entity tag_entity_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.tag_entity
    ADD CONSTRAINT tag_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 24916)
-- Name: variables variables_key_key; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.variables
    ADD CONSTRAINT variables_key_key UNIQUE (key);


--
-- TOC entry 3808 (class 2606 OID 24991)
-- Name: variables variables_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.variables
    ADD CONSTRAINT variables_pkey PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 24975)
-- Name: workflow_entity workflow_entity_pkey; Type: CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflow_entity
    ADD CONSTRAINT workflow_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3845 (class 1259 OID 25526)
-- Name: IDX_14f68deffaf858465715995508; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_14f68deffaf858465715995508" ON n8n_schema.folder USING btree ("projectId", id);


--
-- TOC entry 3850 (class 1259 OID 25609)
-- Name: IDX_1d8ab99d5861c9388d2dc1cf73; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_1d8ab99d5861c9388d2dc1cf73" ON n8n_schema.insights_metadata USING btree ("workflowId");


--
-- TOC entry 3811 (class 1259 OID 25020)
-- Name: IDX_1e31657f5fe46816c34be7c1b4; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_1e31657f5fe46816c34be7c1b4" ON n8n_schema.workflow_history USING btree ("workflowId");


--
-- TOC entry 3839 (class 1259 OID 25397)
-- Name: IDX_1ef35bac35d20bdae979d917a3; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_1ef35bac35d20bdae979d917a3" ON n8n_schema.user_api_keys USING btree ("apiKey");


--
-- TOC entry 3816 (class 1259 OID 25262)
-- Name: IDX_5f0643f6717905a05164090dde; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_5f0643f6717905a05164090dde" ON n8n_schema.project_relation USING btree ("userId");


--
-- TOC entry 3855 (class 1259 OID 25634)
-- Name: IDX_60b6a84299eeb3f671dfec7693; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_60b6a84299eeb3f671dfec7693" ON n8n_schema.insights_by_period USING btree ("periodStart", type, "periodUnit", "metaId");


--
-- TOC entry 3817 (class 1259 OID 25261)
-- Name: IDX_61448d56d61802b5dfde5cdb00; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_61448d56d61802b5dfde5cdb00" ON n8n_schema.project_relation USING btree ("projectId");


--
-- TOC entry 3840 (class 1259 OID 25396)
-- Name: IDX_63d7bbae72c767cf162d459fcc; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_63d7bbae72c767cf162d459fcc" ON n8n_schema.user_api_keys USING btree ("userId", label);


--
-- TOC entry 3861 (class 1259 OID 25669)
-- Name: IDX_8e4b4774db42f1e6dda3452b2a; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_8e4b4774db42f1e6dda3452b2a" ON n8n_schema.test_case_execution USING btree ("testRunId");


--
-- TOC entry 3829 (class 1259 OID 25356)
-- Name: IDX_97f863fa83c4786f1956508496; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_97f863fa83c4786f1956508496" ON n8n_schema.execution_annotations USING btree ("executionId");


--
-- TOC entry 3835 (class 1259 OID 25380)
-- Name: IDX_a3697779b366e131b2bbdae297; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_a3697779b366e131b2bbdae297" ON n8n_schema.execution_annotation_tags USING btree ("tagId");


--
-- TOC entry 3832 (class 1259 OID 25364)
-- Name: IDX_ae51b54c4bb430cf92f48b623f; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_ae51b54c4bb430cf92f48b623f" ON n8n_schema.annotation_tag_entity USING btree (name);


--
-- TOC entry 3836 (class 1259 OID 25381)
-- Name: IDX_c1519757391996eb06064f0e7c; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_c1519757391996eb06064f0e7c" ON n8n_schema.execution_annotation_tags USING btree ("annotationId");


--
-- TOC entry 3824 (class 1259 OID 25329)
-- Name: IDX_cec8eea3bf49551482ccb4933e; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX "IDX_cec8eea3bf49551482ccb4933e" ON n8n_schema.execution_metadata USING btree ("executionId", key);


--
-- TOC entry 3858 (class 1259 OID 25649)
-- Name: IDX_d6870d3b6e4c185d33926f423c; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_d6870d3b6e4c185d33926f423c" ON n8n_schema.test_run USING btree ("workflowId");


--
-- TOC entry 3766 (class 1259 OID 25021)
-- Name: IDX_execution_entity_deletedAt; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_execution_entity_deletedAt" ON n8n_schema.execution_entity USING btree ("deletedAt");


--
-- TOC entry 3772 (class 1259 OID 25005)
-- Name: IDX_workflow_entity_name; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX "IDX_workflow_entity_name" ON n8n_schema.workflow_entity USING btree (name);


--
-- TOC entry 3764 (class 1259 OID 24712)
-- Name: idx_07fde106c0b471d8cc80a64fc8; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX idx_07fde106c0b471d8cc80a64fc8 ON n8n_schema.credentials_entity USING btree (type);


--
-- TOC entry 3778 (class 1259 OID 24636)
-- Name: idx_16f4436789e804e3e1c9eeb240; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX idx_16f4436789e804e3e1c9eeb240 ON n8n_schema.webhook_entity USING btree ("webhookId", method, "pathLength");


--
-- TOC entry 3779 (class 1259 OID 24644)
-- Name: idx_812eb05f7451ca757fb98444ce; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX idx_812eb05f7451ca757fb98444ce ON n8n_schema.tag_entity USING btree (name);


--
-- TOC entry 3767 (class 1259 OID 25339)
-- Name: idx_execution_entity_stopped_at_status_deleted_at; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX idx_execution_entity_stopped_at_status_deleted_at ON n8n_schema.execution_entity USING btree ("stoppedAt", status, "deletedAt") WHERE (("stoppedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- TOC entry 3768 (class 1259 OID 25338)
-- Name: idx_execution_entity_wait_till_status_deleted_at; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX idx_execution_entity_wait_till_status_deleted_at ON n8n_schema.execution_entity USING btree ("waitTill", status, "deletedAt") WHERE (("waitTill" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- TOC entry 3769 (class 1259 OID 25337)
-- Name: idx_execution_entity_workflow_id_started_at; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX idx_execution_entity_workflow_id_started_at ON n8n_schema.execution_entity USING btree ("workflowId", "startedAt") WHERE (("startedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- TOC entry 3783 (class 1259 OID 24937)
-- Name: idx_workflows_tags_workflow_id; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE INDEX idx_workflows_tags_workflow_id ON n8n_schema.workflows_tags USING btree ("workflowId");


--
-- TOC entry 3765 (class 1259 OID 24978)
-- Name: pk_credentials_entity_id; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX pk_credentials_entity_id ON n8n_schema.credentials_entity USING btree (id);


--
-- TOC entry 3780 (class 1259 OID 24934)
-- Name: pk_tag_entity_id; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX pk_tag_entity_id ON n8n_schema.tag_entity USING btree (id);


--
-- TOC entry 3804 (class 1259 OID 24989)
-- Name: pk_variables_id; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX pk_variables_id ON n8n_schema.variables USING btree (id);


--
-- TOC entry 3773 (class 1259 OID 24933)
-- Name: pk_workflow_entity_id; Type: INDEX; Schema: n8n_schema; Owner: n8n_user
--

CREATE UNIQUE INDEX pk_workflow_entity_id ON n8n_schema.workflow_entity USING btree (id);


--
-- TOC entry 3885 (class 2606 OID 25407)
-- Name: processed_data FK_06a69a7032c97a763c2c7599464; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.processed_data
    ADD CONSTRAINT "FK_06a69a7032c97a763c2c7599464" FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3890 (class 2606 OID 25599)
-- Name: insights_metadata FK_1d8ab99d5861c9388d2dc1cf733; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_metadata
    ADD CONSTRAINT "FK_1d8ab99d5861c9388d2dc1cf733" FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE SET NULL;


--
-- TOC entry 3873 (class 2606 OID 25015)
-- Name: workflow_history FK_1e31657f5fe46816c34be7c1b4b; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflow_history
    ADD CONSTRAINT "FK_1e31657f5fe46816c34be7c1b4b" FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 25604)
-- Name: insights_metadata FK_2375a1eda085adb16b24615b69c; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_metadata
    ADD CONSTRAINT "FK_2375a1eda085adb16b24615b69c" FOREIGN KEY ("projectId") REFERENCES n8n_schema.project(id) ON DELETE SET NULL;


--
-- TOC entry 3880 (class 2606 OID 25324)
-- Name: execution_metadata FK_31d0b4c93fb85ced26f6005cda3; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_metadata
    ADD CONSTRAINT "FK_31d0b4c93fb85ced26f6005cda3" FOREIGN KEY ("executionId") REFERENCES n8n_schema.execution_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3876 (class 2606 OID 25279)
-- Name: shared_credentials FK_416f66fc846c7c442970c094ccf; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.shared_credentials
    ADD CONSTRAINT "FK_416f66fc846c7c442970c094ccf" FOREIGN KEY ("credentialsId") REFERENCES n8n_schema.credentials_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3874 (class 2606 OID 25256)
-- Name: project_relation FK_5f0643f6717905a05164090dde7; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.project_relation
    ADD CONSTRAINT "FK_5f0643f6717905a05164090dde7" FOREIGN KEY ("userId") REFERENCES n8n_schema."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3875 (class 2606 OID 25251)
-- Name: project_relation FK_61448d56d61802b5dfde5cdb002; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.project_relation
    ADD CONSTRAINT "FK_61448d56d61802b5dfde5cdb002" FOREIGN KEY ("projectId") REFERENCES n8n_schema.project(id) ON DELETE CASCADE;


--
-- TOC entry 3893 (class 2606 OID 25629)
-- Name: insights_by_period FK_6414cfed98daabbfdd61a1cfbc0; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_by_period
    ADD CONSTRAINT "FK_6414cfed98daabbfdd61a1cfbc0" FOREIGN KEY ("metaId") REFERENCES n8n_schema.insights_metadata("metaId") ON DELETE CASCADE;


--
-- TOC entry 3892 (class 2606 OID 25617)
-- Name: insights_raw FK_6e2e33741adef2a7c5d66befa4e; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.insights_raw
    ADD CONSTRAINT "FK_6e2e33741adef2a7c5d66befa4e" FOREIGN KEY ("metaId") REFERENCES n8n_schema.insights_metadata("metaId") ON DELETE CASCADE;


--
-- TOC entry 3869 (class 2606 OID 24810)
-- Name: installed_nodes FK_73f857fc5dce682cef8a99c11dbddbc969618951; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.installed_nodes
    ADD CONSTRAINT "FK_73f857fc5dce682cef8a99c11dbddbc969618951" FOREIGN KEY (package) REFERENCES n8n_schema.installed_packages("packageName") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3886 (class 2606 OID 25521)
-- Name: folder FK_804ea52f6729e3940498bd54d78; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.folder
    ADD CONSTRAINT "FK_804ea52f6729e3940498bd54d78" FOREIGN KEY ("parentFolderId") REFERENCES n8n_schema.folder(id) ON DELETE CASCADE;


--
-- TOC entry 3877 (class 2606 OID 25284)
-- Name: shared_credentials FK_812c2852270da1247756e77f5a4; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.shared_credentials
    ADD CONSTRAINT "FK_812c2852270da1247756e77f5a4" FOREIGN KEY ("projectId") REFERENCES n8n_schema.project(id) ON DELETE CASCADE;


--
-- TOC entry 3895 (class 2606 OID 25659)
-- Name: test_case_execution FK_8e4b4774db42f1e6dda3452b2af; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.test_case_execution
    ADD CONSTRAINT "FK_8e4b4774db42f1e6dda3452b2af" FOREIGN KEY ("testRunId") REFERENCES n8n_schema.test_run(id) ON DELETE CASCADE;


--
-- TOC entry 3888 (class 2606 OID 25532)
-- Name: folder_tag FK_94a60854e06f2897b2e0d39edba; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.folder_tag
    ADD CONSTRAINT "FK_94a60854e06f2897b2e0d39edba" FOREIGN KEY ("folderId") REFERENCES n8n_schema.folder(id) ON DELETE CASCADE;


--
-- TOC entry 3881 (class 2606 OID 25351)
-- Name: execution_annotations FK_97f863fa83c4786f19565084960; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_annotations
    ADD CONSTRAINT "FK_97f863fa83c4786f19565084960" FOREIGN KEY ("executionId") REFERENCES n8n_schema.execution_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3882 (class 2606 OID 25375)
-- Name: execution_annotation_tags FK_a3697779b366e131b2bbdae2976; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_annotation_tags
    ADD CONSTRAINT "FK_a3697779b366e131b2bbdae2976" FOREIGN KEY ("tagId") REFERENCES n8n_schema.annotation_tag_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3878 (class 2606 OID 25310)
-- Name: shared_workflow FK_a45ea5f27bcfdc21af9b4188560; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.shared_workflow
    ADD CONSTRAINT "FK_a45ea5f27bcfdc21af9b4188560" FOREIGN KEY ("projectId") REFERENCES n8n_schema.project(id) ON DELETE CASCADE;


--
-- TOC entry 3887 (class 2606 OID 25516)
-- Name: folder FK_a8260b0b36939c6247f385b8221; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.folder
    ADD CONSTRAINT "FK_a8260b0b36939c6247f385b8221" FOREIGN KEY ("projectId") REFERENCES n8n_schema.project(id) ON DELETE CASCADE;


--
-- TOC entry 3883 (class 2606 OID 25370)
-- Name: execution_annotation_tags FK_c1519757391996eb06064f0e7c8; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_annotation_tags
    ADD CONSTRAINT "FK_c1519757391996eb06064f0e7c8" FOREIGN KEY ("annotationId") REFERENCES n8n_schema.execution_annotations(id) ON DELETE CASCADE;


--
-- TOC entry 3894 (class 2606 OID 25644)
-- Name: test_run FK_d6870d3b6e4c185d33926f423c8; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.test_run
    ADD CONSTRAINT "FK_d6870d3b6e4c185d33926f423c8" FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3879 (class 2606 OID 25305)
-- Name: shared_workflow FK_daa206a04983d47d0a9c34649ce; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.shared_workflow
    ADD CONSTRAINT "FK_daa206a04983d47d0a9c34649ce" FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3889 (class 2606 OID 25537)
-- Name: folder_tag FK_dc88164176283de80af47621746; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.folder_tag
    ADD CONSTRAINT "FK_dc88164176283de80af47621746" FOREIGN KEY ("tagId") REFERENCES n8n_schema.tag_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 25391)
-- Name: user_api_keys FK_e131705cbbc8fb589889b02d457; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.user_api_keys
    ADD CONSTRAINT "FK_e131705cbbc8fb589889b02d457" FOREIGN KEY ("userId") REFERENCES n8n_schema."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3896 (class 2606 OID 25664)
-- Name: test_case_execution FK_e48965fac35d0f5b9e7f51d8c44; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.test_case_execution
    ADD CONSTRAINT "FK_e48965fac35d0f5b9e7f51d8c44" FOREIGN KEY ("executionId") REFERENCES n8n_schema.execution_entity(id) ON DELETE SET NULL;


--
-- TOC entry 3871 (class 2606 OID 24891)
-- Name: auth_identity auth_identity_userId_fkey; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.auth_identity
    ADD CONSTRAINT "auth_identity_userId_fkey" FOREIGN KEY ("userId") REFERENCES n8n_schema."user"(id);


--
-- TOC entry 3872 (class 2606 OID 24997)
-- Name: execution_data execution_data_fk; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_data
    ADD CONSTRAINT execution_data_fk FOREIGN KEY ("executionId") REFERENCES n8n_schema.execution_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3864 (class 2606 OID 24969)
-- Name: execution_entity fk_execution_entity_workflow_id; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.execution_entity
    ADD CONSTRAINT fk_execution_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3866 (class 2606 OID 24963)
-- Name: webhook_entity fk_webhook_entity_workflow_id; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.webhook_entity
    ADD CONSTRAINT fk_webhook_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3865 (class 2606 OID 25588)
-- Name: workflow_entity fk_workflow_parent_folder; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflow_entity
    ADD CONSTRAINT fk_workflow_parent_folder FOREIGN KEY ("parentFolderId") REFERENCES n8n_schema.folder(id) ON DELETE CASCADE;


--
-- TOC entry 3870 (class 2606 OID 24958)
-- Name: workflow_statistics fk_workflow_statistics_workflow_id; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflow_statistics
    ADD CONSTRAINT fk_workflow_statistics_workflow_id FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3867 (class 2606 OID 24943)
-- Name: workflows_tags fk_workflows_tags_tag_id; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflows_tags
    ADD CONSTRAINT fk_workflows_tags_tag_id FOREIGN KEY ("tagId") REFERENCES n8n_schema.tag_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3868 (class 2606 OID 24938)
-- Name: workflows_tags fk_workflows_tags_workflow_id; Type: FK CONSTRAINT; Schema: n8n_schema; Owner: n8n_user
--

ALTER TABLE ONLY n8n_schema.workflows_tags
    ADD CONSTRAINT fk_workflows_tags_workflow_id FOREIGN KEY ("workflowId") REFERENCES n8n_schema.workflow_entity(id) ON DELETE CASCADE;


-- Completed on 2025-07-10 04:14:53 CST

--
-- PostgreSQL database dump complete
--

