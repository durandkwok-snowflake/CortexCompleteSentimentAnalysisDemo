# CortexCompleteSentimentAnalysisDemo

Sentiment Analysis with Snowflake Cortex and LLaMA2-70B
This repository demonstrates how to use Snowflake Cortex Complete with the LLaMA2-70B model to perform sentiment analysis on ride-share comments. The demo showcases how to integrate Snowflake's AI capabilities to classify customer reviews as Positive, Negative, or Neutral.

## Overview
This project leverages Snowflake Cortex to analyze user comments left on ride-share services like Uber. Using the LLaMA2-70B model for natural language processing, we classify each comment into one of three categories: Positive, Negative, or Neutral.

## Prerequisites
Before running this demo, ensure you have:

A Snowflake account with access to Snowflake Cortex.
Permissions to execute Snowflake Cortex COMPLETE commands.

## Schema and Table Setup
We create a database, schema, and table in Snowflake to store the ride-share comments. The table structure includes fields for the comment text and the resulting sentiment classification.

```SQL
CREATE OR REPLACE DATABASE CORTEX_COMPLETE_SENTIMENT;
USE DATABASE CORTEX_COMPLETE_SENTIMENT;

CREATE OR REPLACE SCHEMA CORTEX_COMPLETE_SENTIMENT_SCHEMA;
USE SCHEMA CORTEX_COMPLETE_SENTIMENT_SCHEMA;

CREATE OR REPLACE TABLE UBER_RIDERS_COMMENTS (
    MEMBER VARCHAR,
    RIDE_COMMENTS VARCHAR,
    SENTIMENT VARCHAR
);
```

## Data Insertion
We insert a set of sample ride-share comments into the table, which will be processed for sentiment analysis.
Example:
```SQL
INSERT INTO UBER_RIDERS_COMMENTS (MEMBER, RIDE_COMMENTS, SENTIMENT)
VALUES ('JOHN', 'Cancelled trip again...', NULL),
       ('TINA', 'We recently took an Uber ride...', NULL),
       -- more comments follow
       ('JILL', 'Driver was excellent and very knowledgeable about the area...', NULL);
```

### Sentiment Analysis
We use Snowflake Cortex to run the sentiment analysis on the ride comments. The LLaMA2-70B model processes each comment and returns the sentiment as "Positive", "Negative", or "Neutral."

### Result Extraction
The LLM_RESPONSE Common Table Expression (CTE) captures the responses, and we extract the sentiment to display alongside the original comments.

```SQL
WITH LLM_RESPONSE AS (
    SELECT
        MEMBER,
        RIDE_COMMENTS,
        SNOWFLAKE.CORTEX.COMPLETE(
            'llama2-70b-chat',
            [
                {'role': 'system', 'content': 'You are a helpful AI assistant. Analyze the review text and determine the overall sentiment. Answer with just "Positive", "Negative", or "Neutral"'},
                {'role': 'user', 'content': a.RIDE_COMMENTS}
            ],
            {}
        ) AS response
    FROM UBER_RIDERS_COMMENTS a
)
SELECT
    MEMBER,
    RIDE_COMMENTS,
    TRIM(response:choices [0] :messages::string) AS sentiment
FROM LLM_RESPONSE;
```

![image](https://github.com/user-attachments/assets/31dca457-d583-40cd-b08c-e03a797039e6)



