{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- BEGIN DEMO USING COMPLETE llama2-70b-chat FOR SENTIMENT ANALYSIS ON RIDE SHARE COMMENTS\
-------------------------------\
-- DDL\
-------------------------------\
CREATE\
OR REPLACE DATABASE CORTEX_COMPLETE_SENTIMENT;\
\
USE DATABASE CORTEX_COMPLETE_SENTIMENT;\
\
CREATE\
OR REPLACE SCHEMA CORTEX_COMPLETE_SENTIMENT_SCHMEA;\
\
USE SCHEMA CORTEX_COMPLETE_SENTIMENT_SCHMEA;\
\
CREATE\
OR REPLACE TABLE UBER_RIDERS_COMMENTS (\
    MEMBER VARCHAR,\
    RIDE_COMMENTS VARCHAR\
    ,SENTIMENT VARCHAR\
);\
\
-------------------------------\
-- Insert Comments\
-------------------------------\
\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JOHN',\
        'Cancelled trip again. Stood outside manchester airport waiting in the rain for the Uber driver only for them to cancel after having us walk through the airport outside to the meeting point. It\'92s not acceptable that drivers can just cancel, they clearly only do so at the opportunity of a better fare. Uber drivers should be penalised for this and charged a cancellation fee that gets paid to the customer to discourage this behaviour. 4th time this has happens now. Needless to say we never use Uber for airport trips any longer',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'TINA',\
        'We recently took an Uber ride to our hotel from the Las Vegas airport on October 1, 2023. Rovie was our driver. He made our trip so fun. He was friendly and entertaining. If anyone is ever in Las Vegas and has the pleasure of having him as a driver, your experience will be great. A Big Thumbs Up to Rovie!',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MIKE',\
        'I had two drivers cancel their trip on me while trying to get an Uber to the airport. I watched the third driver that accepted my ride go in the wrong direction and in a circle so I cancelled the pick up and I still had to pay the cancellation fee',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    ('CHRISTINE', 'The uber driver was okay', NULL);\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'TOM',\
        'The uber driver was ontime but the car was not clean',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ALICE',\
        'The driver was professional but the car had an unpleasant odor.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'BOB',\
        'Great service! The driver was on time and got me to my destination quickly.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JAMES',\
        'The driver took a longer route than necessary, adding to the cost of the trip.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JULIE',\
        'Driver was very kind and helped with my luggage.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'STEVE',\
        'Driver was late and seemed distracted during the trip.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'NANCY',\
        'The car was clean, but the driver didn\'92t talk much. Overall, it was a decent ride.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'PETER',\
        'Driver cancelled my ride last minute. Very frustrating.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'LISA',\
        'Had a great experience! The driver was friendly and the car was clean.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ROBERT',\
        'Driver arrived late and didn\'92t apologize. The trip was okay but not great.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SUSAN',\
        'Driver was very professional and knew exactly how to get to my destination.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'RICHARD',\
        'The driver was on time but the car was very old and uncomfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'KAREN',\
        'Great experience! The driver even had water and snacks available for passengers.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'DAVID',\
        'Driver was very slow and took a strange route to my destination.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'LAURA',\
        'Driver was on time, car was clean, and the ride was smooth. Can\'92t ask for more.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'PAUL',\
        'The ride was fine, but the driver didn\'92t help with my bags.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'AMANDA',\
        'The driver was extremely rude and unprofessional. Worst Uber experience I\'92ve had.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MATT',\
        'Very satisfied with the ride. The driver was friendly and efficient.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'EMILY',\
        'Driver was polite but drove too fast, making me uncomfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'CHRIS',\
        'The car was in poor condition and the driver was rude.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'KATIE',\
        'Driver was excellent, knew the city well, and gave great recommendations.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'TOM',\
        'The driver was courteous, but the car could have been cleaner.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'KIM',\
        'I had to cancel the ride because the driver was taking too long to arrive.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'GREG',\
        'The driver was very patient with traffic and did a great job. Will use again.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MEGAN',\
        'The trip was fine, but the driver didn\'92t follow the GPS properly.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JOHN',\
        'The driver was polite, but the trip took longer than expected due to heavy traffic.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'TINA',\
        'Driver was amazing! Very polite and drove safely.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MIKE',\
        'The ride was okay but the driver didn\'92t seem to know the best route.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SANDRA',\
        'Driver was on time, but the car had a strong odor.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'TIM',\
        'The driver was very friendly and helpful. Great service!',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'LUCY',\
        'The driver didn\'92t speak English well, which made communication difficult.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ADAM',\
        'I had a very smooth ride. The driver was professional and the car was clean.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JANE',\
        'Driver was fine, but the car could have been cleaner.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'BRIAN',\
        'The driver was very rude and refused to follow my directions.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'LAUREN',\
        'Driver was kind but the car was very old and uncomfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SHAWN',\
        'The driver was excellent, knew the fastest route, and got me there on time.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'VICTORIA',\
        'The driver was okay, but the car wasn\'92t clean.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'HENRY',\
        'Driver was friendly and helpful, but the car had an unpleasant smell.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ERICA',\
        'The driver was polite, and the ride was smooth. Will use again.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'PATRICK',\
        'The driver was late, and the car was not clean. Very disappointing.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SOPHIA',\
        'Great ride! The driver was professional, and the car was spotless.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JACK',\
        'Driver arrived on time but the ride took longer due to heavy traffic.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'LINDA',\
        'The driver was excellent, and the car was very clean and comfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'DAN',\
        'Driver was courteous but didn\'92t know the best route to my destination.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MOLLY',\
        'The driver was very rude and the car was in poor condition.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'GEORGE',\
        'The driver was on time and very professional. Great service.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'RACHEL',\
        'The driver was friendly, but the car was not clean.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SCOTT',\
        'Had a great experience! The driver was punctual and friendly.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'HANNAH',\
        'The ride was okay, but the driver didn\'92t seem very knowledgeable about the area.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'DEREK',\
        'The driver was fantastic! Very professional and knew the best route.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ASHLEY',\
        'The driver was polite but didn\'92t speak much during the ride.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ZACH',\
        'The ride was smooth, but the driver took a slightly longer route than necessary.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'NICOLE',\
        'Driver was very friendly and arrived on time. No complaints!',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'BILL',\
        'The car was very dirty and the driver was late.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ELLA',\
        'Driver was professional and the car was spotless. Very satisfied.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ANDREW',\
        'The driver was okay but the car wasn\'92t comfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'FELICIA',\
        'Great experience! The driver was punctual and polite.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MARC',\
        'The driver got lost and took a very long route. Not happy with the service.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'MONICA',\
        'Driver was great, but the car was not in good condition.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SEAN',\
        'The driver was very polite, but the ride was uncomfortable due to the condition of the car.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ANNA',\
        'Driver was courteous and the ride was smooth. Good experience.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'TREVOR',\
        'The driver was rude and the car was filthy. Worst Uber experience.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'EVA',\
        'The driver was excellent and the car was very clean and comfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'SAM',\
        'The driver took a very long route and didn\'92t seem to know the area well.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'NATHAN',\
        'Driver was polite but didn\'92t follow my directions.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JENNY',\
        'Great ride! The driver was professional and the car was clean.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'OWEN',\
        'The driver arrived late and the car was not clean. Disappointed with the service.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'LEAH',\
        'Driver was friendly and arrived on time. Overall a good experience.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ALEX',\
        'The car was dirty and the driver was not professional.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'VANESSA',\
        'Driver was professional and the ride was smooth. No complaints!',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ETHAN',\
        'Driver was late and took a very long route to my destination.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JULIA',\
        'The driver was excellent, but the car could have been cleaner.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'CHARLIE',\
        'Great experience! The driver was very friendly and arrived on time.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'ISABEL',\
        'Driver was fine but didn\'92t follow the GPS, which led to a longer trip.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'BRAD',\
        'The driver was polite, but the car was old and uncomfortable.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'OLIVIA',\
        'Driver was professional and the car was spotless. Very happy with the service.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JASON',\
        'The driver got lost and made me late to my appointment.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'KAREN',\
        'Great ride! The driver was friendly and helpful.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'DYLAN',\
        'The driver was late and took the wrong route, which was frustrating.',\
        NULL\
    );\
INSERT INTO\
    UBER_RIDERS_COMMENTS\
VALUES\
    (\
        'JILL',\
        'Driver was excellent and very knowledgeable about the area. 5 stars!',\
        NULL\
    );\
\
-------------------------------\
-- Check Comments\
-------------------------------\
    \
SELECT\
    *\
FROM\
    UBER_RIDERS_COMMENTS;\
    \
select\
    count(*)\
from\
    UBER_RIDERS_COMMENTS;\
\
    \
----------------------------------\
-- Call Complete to get Sentiment\
----------------------------------\
    \
-- Extract message from json\
    WITH LLM_RESPONSE AS (\
        SELECT\
            MEMBER,\
            RIDE_COMMENTS,\
            SNOWFLAKE.CORTEX.COMPLETE(\
                'llama2-70b-chat',\
                [\
                \{'role': 'system', 'content': 'You are a helpful AI assistant. Analyze the review text and determine the overall sentiment. Answer with just \\"Positive\\", \\"Negative\\", or \\"Neutral\\"'\},\
                \{'role': 'user', 'content': a.RIDE_COMMENTS\}\
            ],\
                \{ \}\
            ) AS response\
        FROM\
            UBER_RIDERS_COMMENTS a\
    )\
SELECT\
    MEMBER,\
    RIDE_COMMENTS,\
    response,\
    TRIM(response:choices [0] :messages::string) AS sentiment\
FROM\
    LLM_RESPONSE;\
\
    \
-- END DEMO USING COMPLETE llama2-70b-chat FOR SENTIMENT ANALYSIS ON RIDE SHARE COMMENTS}