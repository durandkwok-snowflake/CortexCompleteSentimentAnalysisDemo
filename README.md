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

