# IBM Z Database Health Assistant

### A Db2 for z/OS Intelligent Health Analyzer built with REXX, DSNREXX, SMF and RMF

------

# Overview

IBM Z Database Health Assistant is an experimental project designed to provide a lightweight intelligent assessment engine for Db2 for z/OS environments.

The solution emulates some capabilities commonly found in enterprise observability and AI-driven database advisory tools by combining native z/OS technologies such as:

- REXX
- DSNREXX
- Db2 Catalog
- Db2 RTS (Real Time Statistics)
- IFCIDs
- SMF 100/101
- RMF III
- WLM Metrics
- z/OS UNIX
- JSON export capabilities

The objective is to provide a centralized health assessment of Db2 subsystems running on IBM Z.

------

# Objectives

The assistant was designed to answer questions such as:

- Is my Db2 subsystem healthy?
- Which objects require REORG?
- Which tablespaces need RUNSTATS?
- Are buffer pools properly sized?
- Is CPU consumption above expected thresholds?
- Are access paths becoming inefficient?
- Which workloads have degraded response times?

------

# Features

## Health Score Engine

Generates an overall score.

Example:

Health Score: 92 (Healthy)

Score ranges:

| Score  | Status    |
| ------ | --------- |
| 90-100 | Healthy   |
| 80-89  | Good      |
| 70-79  | Warning   |
| 50-69  | Critical  |
| 0-49   | Emergency |

------

## Db2 Catalog Analysis

Reads:

SYSIBM.SYSTABLESPACESTATS

SYSIBM.SYSINDEXSPACESTATS

SYSIBM.SYSTABLES

Metrics evaluated:

REORGINSERTS

REORGDELETES

STATSTIME

CLUSTERRATIOF

------

## Bufferpool Advisor

Metrics:

Hit Ratio

Sequential Efficiency

Random Getpages

Prefetch Activity

Recommendations:

Optimize Buffer Pools

Increase VPSIZE

Review Deferred Writes

------

## CPU Analyzer

Data Sources:

SMF 100

SMF 101

RMF III

WLM

Detects:

High CPU Consumers

Long Running Threads

Distributed Activity

------

## Access Path Advisor

Detects:

Missing Statistics

Poor Cluster Ratio

Unused Indexes

Table Scans

Excessive Getpages

Recommendation:

Improve Access Paths

------

## REORG Advisor

Identifies:

Tablespaces requiring REORG

Indexes requiring REORG

LOB objects

Partitions

Recommendation:

REORG TABLESPACE

REORG INDEX

------

## RUNSTATS Advisor

Detects stale statistics.

Example:

Statistics older than 30 days

Recommendation:

RUNSTATS TABLESPACE

------

# Architecture

```text
                +------------------------+
                |    HEALTH.REXX         |
                +------------+-----------+
                             |
       ------------------------------------------------
       |                  |                 |
       v                  v                 v

+-------------+   +---------------+   +---------------+
| DSNREXX     |   | RMF Parser    |   | SMF Parser    |
+-------------+   +---------------+   +---------------+
       |                  |                 |
       --------------------------------------
                        |
                Health Engine
                        |
        ---------------------------------
        |               |               |
        v               v               v

   Score Engine   Recommendation   Alert Engine


                        |
                +---------------+
                | Report Writer |
                +---------------+
                        |
        --------------------------------
        |              |               |
        v              v               v

      TSO          HTML           JSON
```

------

# Components

## health.rexx

Main execution engine.

Responsibilities:

Load modules

Calculate score

Generate recommendations

Build reports

------

## catalog.rexx

Catalog collector.

Queries:

SYSIBM.SYSTABLESPACESTATS

SYSINDEXSPACESTATS

------

## cpu.rexx

Reads:

SMF100

SMF101

RMF

------

## reorg.rexx

Detects:

REORG candidates

------

## stats.rexx

Detects:

Missing statistics

Stale statistics

------

## report.rexx

Produces:

Console report

HTML dashboard

JSON

CSV

------

# Health Score Calculation

Initial score:

100

Penalties:

| Condition                  | Penalty |
| -------------------------- | ------- |
| CPU >80%                   | -15     |
| Hit Ratio <95              | -10     |
| Old Statistics             | -5      |
| Excessive REORG candidates | -5      |
| Response Time >300 ms      | -10     |

------

# Sample Output

```text
IBM Z Database Health Assistant

--------------------------------

Health Score : 92 (Healthy)

Critical Issues : 2

Recommendations : 7

Systems : 12



Recommendations

--------------------------------

✓ Optimize Buffer Pools

✓ Improve Hit Ratio

✓ Reduce CPU Consumption

✓ Reorganize Objects

✓ Detect Tables requiring REORG

✓ Update Statistics

✓ Improve Access Paths



CPU Utilization


LPAR1      72%

DB2P       81%

DB2T       64%



Response Time


Class1     142 ms

Class2      88 ms

Class3      11 ms



Assessment completed successfully
```

------

# Future Enhancements

Planned features include:

## AI Advisor

Watsonx integration

LLM recommendations

Natural Language Queries

Example:

"Why is CPU increasing on DB2P?"

Assistant response:

Cluster ratio degraded.

Statistics are 45 days old.

REORG recommended.

------

## Zowe Integration

REST APIs

API Mediation Layer

CLI commands

Example:

zowe db2-health check DB2P

------

## Grafana Integration

JSON exporter

Prometheus exporter

OpenTelemetry

------

## Machine Learning

Trend detection

Forecasting

Anomaly detection

Capacity planning

------

# Technologies

IBM z/OS

Db2 for z/OS

REXX

DSNREXX

SMF

RMF

IFCID

WLM

Zowe

Grafana

OpenTelemetry

------

# License

MIT License

------

# Author

Vagner Bellacosa

IBM Mainframe Specialist

Bellacosa Mainframe

*"Making Db2 for z/OS a little smarter, one REXX at a time."*