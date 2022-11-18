{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "153f88fe",
   "metadata": {
    "papermill": {
     "duration": 0.004046,
     "end_time": "2022-11-18T23:51:02.614875",
     "exception": false,
     "start_time": "2022-11-18T23:51:02.610829",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Summary of Case Study \n",
    "Bellabeat is a high-tech company that manufactures health-focused smart products formed by **Urška Sršen** and **Sando Mur** in **2013**.The company produces different smart devices that collect data on activity, sleep, stress, and reproductive health to enlighten women about their own health and habits.\n",
    "\n",
    "I have been given the task to analyze smart fitness devices data and determine how it could help unlock new growth opportunities for Bellabeat.\n",
    "\n",
    "\n",
    "# Ask Phase\n",
    "\n",
    "## About Bellabeat\n",
    "Bellabeat,a manufacturer of health-focused smart products.Making beautifully designed technology that informs and inspires women around the world.Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat makes products to empower women with knowledge about their own health and habits.With over 9 years in the technology industry and various rollouts of multiple products;Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.\n",
    "\n",
    "### Stakeholders\n",
    "\n",
    "1. **Urška Sršen**: Bellabeat’s cofounder and Chief Creative Officer\n",
    "2. **Sando Mur**: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team\n",
    "3. **Bellabeat marketing analytics team**: responsible for collecting, analyzing, and reporting data that helps guide Bellabeat’s marketing strategy\n",
    "\n",
    "## Business Questions\n",
    "1. What are some trends in smart device usage?\n",
    "2. How could these trends apply to Bellabeat customers?\n",
    "3. How could these trends help influence Bellabeat marketing strategy\n",
    "\n",
    "## Business Task\n",
    "Identify potential opportunities for growth and recommendations for the Bellabeat marketing strategy improvement based on trends in smart device usage.\n",
    "\n",
    "# Prepare Phase\n",
    "\n",
    "The data used is the FitBit Fitness Tracker Data uploaded to Kaggle by Morbius.This data has been cleaned with the help of **Google Spreadsheets** and only the tables relevant to this case study are used.\n",
    "\n",
    "The data used in this case study is open source,and has been dedicated to the public:to be use,modify and distribute for both personal and commercial purposes without having to request for permission.\n",
    "\n",
    "The data used is a distributed survey answered by **30** FitBit users over an estimated period of **31 days**.The users have consented to the submission of personal tracker data including and not limited to physical activity, heart rate, and sleep monitoring.The data available consist of 18 csv files including daily,hourly and minutes variation of records.The daily variation has been selected as the variation for our analysis,and with that I am left with 6 csv files to work with.\n",
    "\n",
    "I then proceeded to loading and cleaning the **6 csv** on **Google Spreadsheet**,and the process has been outlined below:\n",
    "\n",
    "* I loaded all tables in different sheets and first changed all field names(column names) to lower case\n",
    "* I then regulated the date type for tables with similar date types converting date and time to date alone by splittig and deleting.\n",
    "* I then went ahead to confirm the irregularity and inconsistency in the weightinfo table(this would come around to affect the analysis as little to no information could be derived from the table).\n",
    "* I then went ahead to confirm 4 of the tables had 930 observations while weight information and sleep_day had just 67 and 417 obserrvations respectively.\n",
    "\n",
    "\n",
    "\n",
    "# Process Phase\n",
    "I would be using R for my analysis and the packages and libraries I would be using include:\n",
    "\n",
    "* readr\n",
    "* tidyverse\n",
    "* lubridate\n",
    "* ggplot\n",
    "* tidyr\n",
    "* dplyr\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "547aa578",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2022-11-18T23:51:02.624436Z",
     "iopub.status.busy": "2022-11-18T23:51:02.622429Z",
     "iopub.status.idle": "2022-11-18T23:51:03.966874Z",
     "shell.execute_reply": "2022-11-18T23:51:03.964468Z"
    },
    "papermill": {
     "duration": 1.352254,
     "end_time": "2022-11-18T23:51:03.970298",
     "exception": false,
     "start_time": "2022-11-18T23:51:02.618044",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5      \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(readr)\n",
    "library(tidyverse)\n",
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ca0a0db9",
   "metadata": {
    "papermill": {
     "duration": 0.003086,
     "end_time": "2022-11-18T23:51:03.976701",
     "exception": false,
     "start_time": "2022-11-18T23:51:03.973615",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Importing the data\n",
    "I then proceeded to importing the data,making checks on the data and also cleaning the data in preparation for analysis."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "e098ac15",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-18T23:51:04.014636Z",
     "iopub.status.busy": "2022-11-18T23:51:03.984321Z",
     "iopub.status.idle": "2022-11-18T23:51:04.091735Z",
     "shell.execute_reply": "2022-11-18T23:51:04.089919Z"
    },
    "papermill": {
     "duration": 0.114545,
     "end_time": "2022-11-18T23:51:04.094162",
     "exception": false,
     "start_time": "2022-11-18T23:51:03.979617",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    " daily_activity <- read.csv(\"../input/belabeat-case-study/daily_activity.csv\")\n",
    "daily_calories <- read.csv(\"../input/belabeat-case-study/daily_calories.csv\")\n",
    "daily_steps <- read.csv(\"../input/belabeat-case-study/daily_steps.csv\")\n",
    "sleep_day <- read.csv(\"../input/belabeat-case-study/sleep_day.csv\")\n",
    "weight_loginfo <- read.csv(\"../input/belabeat-case-study/weight_loginfo.csv\")\n",
    "daily_intensities <- read.csv(\"../input/belabeat-case-study/daily_intensities.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da57d4fe",
   "metadata": {
    "papermill": {
     "duration": 0.003011,
     "end_time": "2022-11-18T23:51:04.100490",
     "exception": false,
     "start_time": "2022-11-18T23:51:04.097479",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### I then proceeded to confirm the state of my data after the process of importation."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "169a194c",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2022-11-18T23:51:04.109366Z",
     "iopub.status.busy": "2022-11-18T23:51:04.107892Z",
     "iopub.status.idle": "2022-11-18T23:51:04.202489Z",
     "shell.execute_reply": "2022-11-18T23:51:04.200868Z"
    },
    "papermill": {
     "duration": 0.10136,
     "end_time": "2022-11-18T23:51:04.204707",
     "exception": false,
     "start_time": "2022-11-18T23:51:04.103347",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>activitydate</th><th scope=col>totalsteps</th><th scope=col>totaldistance</th><th scope=col>trackerdistance</th><th scope=col>loggedactivitiesdistance</th><th scope=col>veryactivedistance</th><th scope=col>moderatelyactivedistance</th><th scope=col>lightactivedistance</th><th scope=col>sedentaryactivedistance</th><th scope=col>veryactiveminutes</th><th scope=col>fairlyactiveminutes</th><th scope=col>lightlyactiveminutes</th><th scope=col>sedentaryminutes</th><th scope=col>calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & id & activitydate & totalsteps & totaldistance & trackerdistance & loggedactivitiesdistance & veryactivedistance & moderatelyactivedistance & lightactivedistance & sedentaryactivedistance & veryactiveminutes & fairlyactiveminutes & lightlyactiveminutes & sedentaryminutes & calories\\\\\n",
       "  & <dbl> & <chr> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | activitydate &lt;chr&gt; | totalsteps &lt;int&gt; | totaldistance &lt;dbl&gt; | trackerdistance &lt;dbl&gt; | loggedactivitiesdistance &lt;dbl&gt; | veryactivedistance &lt;dbl&gt; | moderatelyactivedistance &lt;dbl&gt; | lightactivedistance &lt;dbl&gt; | sedentaryactivedistance &lt;dbl&gt; | veryactiveminutes &lt;int&gt; | fairlyactiveminutes &lt;int&gt; | lightlyactiveminutes &lt;int&gt; | sedentaryminutes &lt;int&gt; | calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         activitydate totalsteps totaldistance trackerdistance\n",
       "1 1503960366 4/12/2016    13162      8.50          8.50           \n",
       "2 1503960366 4/13/2016    10735      6.97          6.97           \n",
       "3 1503960366 4/14/2016    10460      6.74          6.74           \n",
       "4 1503960366 4/15/2016     9762      6.28          6.28           \n",
       "5 1503960366 4/16/2016    12669      8.16          8.16           \n",
       "6 1503960366 4/17/2016     9705      6.48          6.48           \n",
       "  loggedactivitiesdistance veryactivedistance moderatelyactivedistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  lightactivedistance sedentaryactivedistance veryactiveminutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  fairlyactiveminutes lightlyactiveminutes sedentaryminutes calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>activityday</th><th scope=col>calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & id & activityday & calories\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | activityday &lt;chr&gt; | calories &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         activityday calories\n",
       "1 1503960366 4/12/2016   1985    \n",
       "2 1503960366 4/13/2016   1797    \n",
       "3 1503960366 4/14/2016   1776    \n",
       "4 1503960366 4/15/2016   1745    \n",
       "5 1503960366 4/16/2016   1863    \n",
       "6 1503960366 4/17/2016   1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>activityday</th><th scope=col>step_total</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & id & activityday & step\\_total\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | activityday &lt;chr&gt; | step_total &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         activityday step_total\n",
       "1 1503960366 4/12/2016   13162     \n",
       "2 1503960366 4/13/2016   10735     \n",
       "3 1503960366 4/14/2016   10460     \n",
       "4 1503960366 4/15/2016    9762     \n",
       "5 1503960366 4/16/2016   12669     \n",
       "6 1503960366 4/17/2016    9705     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>sleepday</th><th scope=col>totalsleeprecords</th><th scope=col>totalminutesasleep</th><th scope=col>totaltimeinBed</th><th scope=col>mins_awake_in_bed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>1</td><td>327</td><td>346</td><td>19</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>2</td><td>384</td><td>407</td><td>23</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/15/2016</td><td>1</td><td>412</td><td>442</td><td>30</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/16/2016</td><td>2</td><td>340</td><td>367</td><td>27</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/17/2016</td><td>1</td><td>700</td><td>712</td><td>12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/19/2016</td><td>1</td><td>304</td><td>320</td><td>16</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & id & sleepday & totalsleeprecords & totalminutesasleep & totaltimeinBed & mins\\_awake\\_in\\_bed\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 1 & 327 & 346 & 19\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 2 & 384 & 407 & 23\\\\\n",
       "\t3 & 1503960366 & 4/15/2016 & 1 & 412 & 442 & 30\\\\\n",
       "\t4 & 1503960366 & 4/16/2016 & 2 & 340 & 367 & 27\\\\\n",
       "\t5 & 1503960366 & 4/17/2016 & 1 & 700 & 712 & 12\\\\\n",
       "\t6 & 1503960366 & 4/19/2016 & 1 & 304 & 320 & 16\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 6\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | sleepday &lt;chr&gt; | totalsleeprecords &lt;int&gt; | totalminutesasleep &lt;int&gt; | totaltimeinBed &lt;int&gt; | mins_awake_in_bed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 1 | 327 | 346 | 19 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 2 | 384 | 407 | 23 |\n",
       "| 3 | 1503960366 | 4/15/2016 | 1 | 412 | 442 | 30 |\n",
       "| 4 | 1503960366 | 4/16/2016 | 2 | 340 | 367 | 27 |\n",
       "| 5 | 1503960366 | 4/17/2016 | 1 | 700 | 712 | 12 |\n",
       "| 6 | 1503960366 | 4/19/2016 | 1 | 304 | 320 | 16 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         sleepday  totalsleeprecords totalminutesasleep totaltimeinBed\n",
       "1 1503960366 4/12/2016 1                 327                346           \n",
       "2 1503960366 4/13/2016 2                 384                407           \n",
       "3 1503960366 4/15/2016 1                 412                442           \n",
       "4 1503960366 4/16/2016 2                 340                367           \n",
       "5 1503960366 4/17/2016 1                 700                712           \n",
       "6 1503960366 4/19/2016 1                 304                320           \n",
       "  mins_awake_in_bed\n",
       "1 19               \n",
       "2 23               \n",
       "3 30               \n",
       "4 27               \n",
       "5 12               \n",
       "6 16               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>weight_kg</th><th scope=col>weight_pounds</th><th scope=col>fat</th><th scope=col>bmi</th><th scope=col>ismanualreport</th><th scope=col>log_id</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>5/2/2016 </td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td> TRUE</td><td>1.462234e+12</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>5/3/2016 </td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td> TRUE</td><td>1.462320e+12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1927972279</td><td>4/13/2016</td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>FALSE</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2873212765</td><td>4/21/2016</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td> TRUE</td><td>1.461283e+12</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2873212765</td><td>5/12/2016</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td> TRUE</td><td>1.463098e+12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>4319703577</td><td>4/17/2016</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td> TRUE</td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & id & date & weight\\_kg & weight\\_pounds & fat & bmi & ismanualreport & log\\_id\\\\\n",
       "  & <dbl> & <chr> & <dbl> & <dbl> & <int> & <dbl> & <lgl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 5/2/2016  &  52.6 & 115.9631 & 22 & 22.65 &  TRUE & 1.462234e+12\\\\\n",
       "\t2 & 1503960366 & 5/3/2016  &  52.6 & 115.9631 & NA & 22.65 &  TRUE & 1.462320e+12\\\\\n",
       "\t3 & 1927972279 & 4/13/2016 & 133.5 & 294.3171 & NA & 47.54 & FALSE & 1.460510e+12\\\\\n",
       "\t4 & 2873212765 & 4/21/2016 &  56.7 & 125.0021 & NA & 21.45 &  TRUE & 1.461283e+12\\\\\n",
       "\t5 & 2873212765 & 5/12/2016 &  57.3 & 126.3249 & NA & 21.69 &  TRUE & 1.463098e+12\\\\\n",
       "\t6 & 4319703577 & 4/17/2016 &  72.4 & 159.6147 & 25 & 27.45 &  TRUE & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;chr&gt; | weight_kg &lt;dbl&gt; | weight_pounds &lt;dbl&gt; | fat &lt;int&gt; | bmi &lt;dbl&gt; | ismanualreport &lt;lgl&gt; | log_id &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 5/2/2016  |  52.6 | 115.9631 | 22 | 22.65 |  TRUE | 1.462234e+12 |\n",
       "| 2 | 1503960366 | 5/3/2016  |  52.6 | 115.9631 | NA | 22.65 |  TRUE | 1.462320e+12 |\n",
       "| 3 | 1927972279 | 4/13/2016 | 133.5 | 294.3171 | NA | 47.54 | FALSE | 1.460510e+12 |\n",
       "| 4 | 2873212765 | 4/21/2016 |  56.7 | 125.0021 | NA | 21.45 |  TRUE | 1.461283e+12 |\n",
       "| 5 | 2873212765 | 5/12/2016 |  57.3 | 126.3249 | NA | 21.69 |  TRUE | 1.463098e+12 |\n",
       "| 6 | 4319703577 | 4/17/2016 |  72.4 | 159.6147 | 25 | 27.45 |  TRUE | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date      weight_kg weight_pounds fat bmi   ismanualreport\n",
       "1 1503960366 5/2/2016   52.6     115.9631      22  22.65  TRUE         \n",
       "2 1503960366 5/3/2016   52.6     115.9631      NA  22.65  TRUE         \n",
       "3 1927972279 4/13/2016 133.5     294.3171      NA  47.54 FALSE         \n",
       "4 2873212765 4/21/2016  56.7     125.0021      NA  21.45  TRUE         \n",
       "5 2873212765 5/12/2016  57.3     126.3249      NA  21.69  TRUE         \n",
       "6 4319703577 4/17/2016  72.4     159.6147      25  27.45  TRUE         \n",
       "  log_id      \n",
       "1 1.462234e+12\n",
       "2 1.462320e+12\n",
       "3 1.460510e+12\n",
       "4 1.461283e+12\n",
       "5 1.463098e+12\n",
       "6 1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>activityday</th><th scope=col>sedentaryminutes</th><th scope=col>lightlyactiveminutes</th><th scope=col>fairlyactiveminutes</th><th scope=col>veryactiveminutes</th><th scope=col>sedentaryactivedistance</th><th scope=col>lightactivedistance</th><th scope=col>moderatelyactivedistance</th><th scope=col>veryactivedistance</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td> 728</td><td>328</td><td>13</td><td>25</td><td>0</td><td>6.06</td><td>0.55</td><td>1.88</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td> 776</td><td>217</td><td>19</td><td>21</td><td>0</td><td>4.71</td><td>0.69</td><td>1.57</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1218</td><td>181</td><td>11</td><td>30</td><td>0</td><td>3.91</td><td>0.40</td><td>2.44</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 726</td><td>209</td><td>34</td><td>29</td><td>0</td><td>2.83</td><td>1.26</td><td>2.14</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td> 773</td><td>221</td><td>10</td><td>36</td><td>0</td><td>5.04</td><td>0.41</td><td>2.71</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 539</td><td>164</td><td>20</td><td>38</td><td>0</td><td>2.51</td><td>0.78</td><td>3.19</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & id & activityday & sedentaryminutes & lightlyactiveminutes & fairlyactiveminutes & veryactiveminutes & sedentaryactivedistance & lightactivedistance & moderatelyactivedistance & veryactivedistance\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 &  728 & 328 & 13 & 25 & 0 & 6.06 & 0.55 & 1.88\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 &  776 & 217 & 19 & 21 & 0 & 4.71 & 0.69 & 1.57\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1218 & 181 & 11 & 30 & 0 & 3.91 & 0.40 & 2.44\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  726 & 209 & 34 & 29 & 0 & 2.83 & 1.26 & 2.14\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 &  773 & 221 & 10 & 36 & 0 & 5.04 & 0.41 & 2.71\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  539 & 164 & 20 & 38 & 0 & 2.51 & 0.78 & 3.19\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | activityday &lt;chr&gt; | sedentaryminutes &lt;int&gt; | lightlyactiveminutes &lt;int&gt; | fairlyactiveminutes &lt;int&gt; | veryactiveminutes &lt;int&gt; | sedentaryactivedistance &lt;dbl&gt; | lightactivedistance &lt;dbl&gt; | moderatelyactivedistance &lt;dbl&gt; | veryactivedistance &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 |  728 | 328 | 13 | 25 | 0 | 6.06 | 0.55 | 1.88 |\n",
       "| 2 | 1503960366 | 4/13/2016 |  776 | 217 | 19 | 21 | 0 | 4.71 | 0.69 | 1.57 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1218 | 181 | 11 | 30 | 0 | 3.91 | 0.40 | 2.44 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  726 | 209 | 34 | 29 | 0 | 2.83 | 1.26 | 2.14 |\n",
       "| 5 | 1503960366 | 4/16/2016 |  773 | 221 | 10 | 36 | 0 | 5.04 | 0.41 | 2.71 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  539 | 164 | 20 | 38 | 0 | 2.51 | 0.78 | 3.19 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         activityday sedentaryminutes lightlyactiveminutes\n",
       "1 1503960366 4/12/2016    728             328                 \n",
       "2 1503960366 4/13/2016    776             217                 \n",
       "3 1503960366 4/14/2016   1218             181                 \n",
       "4 1503960366 4/15/2016    726             209                 \n",
       "5 1503960366 4/16/2016    773             221                 \n",
       "6 1503960366 4/17/2016    539             164                 \n",
       "  fairlyactiveminutes veryactiveminutes sedentaryactivedistance\n",
       "1 13                  25                0                      \n",
       "2 19                  21                0                      \n",
       "3 11                  30                0                      \n",
       "4 34                  29                0                      \n",
       "5 10                  36                0                      \n",
       "6 20                  38                0                      \n",
       "  lightactivedistance moderatelyactivedistance veryactivedistance\n",
       "1 6.06                0.55                     1.88              \n",
       "2 4.71                0.69                     1.57              \n",
       "3 3.91                0.40                     2.44              \n",
       "4 2.83                1.26                     2.14              \n",
       "5 5.04                0.41                     2.71              \n",
       "6 2.51                0.78                     3.19              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(daily_activity)\n",
    "head(daily_calories)\n",
    "head(daily_steps)\n",
    "head(sleep_day)\n",
    "head(weight_loginfo)\n",
    "head(daily_intensities)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "712043be",
   "metadata": {
    "papermill": {
     "duration": 0.004576,
     "end_time": "2022-11-18T23:51:04.213700",
     "exception": false,
     "start_time": "2022-11-18T23:51:04.209124",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Standardizing the format of the tables\n",
    "\n",
    "I proceeded to standardize the date format of the tables as follows and then explore the data more;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "27c1789b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-18T23:51:04.225489Z",
     "iopub.status.busy": "2022-11-18T23:51:04.223943Z",
     "iopub.status.idle": "2022-11-18T23:51:04.444639Z",
     "shell.execute_reply": "2022-11-18T23:51:04.443062Z"
    },
    "papermill": {
     "duration": 0.228781,
     "end_time": "2022-11-18T23:51:04.446786",
     "exception": false,
     "start_time": "2022-11-18T23:51:04.218005",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>totalsteps</th><th scope=col>totaldistance</th><th scope=col>trackerdistance</th><th scope=col>loggedactivitiesdistance</th><th scope=col>veryactivedistance</th><th scope=col>moderatelyactivedistance</th><th scope=col>lightactivedistance</th><th scope=col>sedentaryactivedistance</th><th scope=col>veryactiveminutes</th><th scope=col>fairlyactiveminutes</th><th scope=col>lightlyactiveminutes</th><th scope=col>sedentaryminutes</th><th scope=col>calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & id & date & totalsteps & totaldistance & trackerdistance & loggedactivitiesdistance & veryactivedistance & moderatelyactivedistance & lightactivedistance & sedentaryactivedistance & veryactiveminutes & fairlyactiveminutes & lightlyactiveminutes & sedentaryminutes & calories\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | totalsteps &lt;int&gt; | totaldistance &lt;dbl&gt; | trackerdistance &lt;dbl&gt; | loggedactivitiesdistance &lt;dbl&gt; | veryactivedistance &lt;dbl&gt; | moderatelyactivedistance &lt;dbl&gt; | lightactivedistance &lt;dbl&gt; | sedentaryactivedistance &lt;dbl&gt; | veryactiveminutes &lt;int&gt; | fairlyactiveminutes &lt;int&gt; | lightlyactiveminutes &lt;int&gt; | sedentaryminutes &lt;int&gt; | calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       totalsteps totaldistance trackerdistance\n",
       "1 1503960366 2016-04-12 13162      8.50          8.50           \n",
       "2 1503960366 2016-04-13 10735      6.97          6.97           \n",
       "3 1503960366 2016-04-14 10460      6.74          6.74           \n",
       "4 1503960366 2016-04-15  9762      6.28          6.28           \n",
       "5 1503960366 2016-04-16 12669      8.16          8.16           \n",
       "6 1503960366 2016-04-17  9705      6.48          6.48           \n",
       "  loggedactivitiesdistance veryactivedistance moderatelyactivedistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  lightactivedistance sedentaryactivedistance veryactiveminutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  fairlyactiveminutes lightlyactiveminutes sedentaryminutes calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & id & date & calories\\\\\n",
       "  & <dbl> & <date> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 1985\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 1797\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 1776\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 & 1745\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 & 1863\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | calories &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 1985 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 1797 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 1776 |\n",
       "| 4 | 1503960366 | 2016-04-15 | 1745 |\n",
       "| 5 | 1503960366 | 2016-04-16 | 1863 |\n",
       "| 6 | 1503960366 | 2016-04-17 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       calories\n",
       "1 1503960366 2016-04-12 1985    \n",
       "2 1503960366 2016-04-13 1797    \n",
       "3 1503960366 2016-04-14 1776    \n",
       "4 1503960366 2016-04-15 1745    \n",
       "5 1503960366 2016-04-16 1863    \n",
       "6 1503960366 2016-04-17 1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>sedentaryminutes</th><th scope=col>lightlyactiveminutes</th><th scope=col>fairlyactiveminutes</th><th scope=col>veryactiveminutes</th><th scope=col>sedentaryactivedistance</th><th scope=col>lightactivedistance</th><th scope=col>moderatelyactivedistance</th><th scope=col>veryactivedistance</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td> 728</td><td>328</td><td>13</td><td>25</td><td>0</td><td>6.06</td><td>0.55</td><td>1.88</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td> 776</td><td>217</td><td>19</td><td>21</td><td>0</td><td>4.71</td><td>0.69</td><td>1.57</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>1218</td><td>181</td><td>11</td><td>30</td><td>0</td><td>3.91</td><td>0.40</td><td>2.44</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td> 726</td><td>209</td><td>34</td><td>29</td><td>0</td><td>2.83</td><td>1.26</td><td>2.14</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td> 773</td><td>221</td><td>10</td><td>36</td><td>0</td><td>5.04</td><td>0.41</td><td>2.71</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td> 539</td><td>164</td><td>20</td><td>38</td><td>0</td><td>2.51</td><td>0.78</td><td>3.19</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & id & date & sedentaryminutes & lightlyactiveminutes & fairlyactiveminutes & veryactiveminutes & sedentaryactivedistance & lightactivedistance & moderatelyactivedistance & veryactivedistance\\\\\n",
       "  & <dbl> & <date> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 &  728 & 328 & 13 & 25 & 0 & 6.06 & 0.55 & 1.88\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 &  776 & 217 & 19 & 21 & 0 & 4.71 & 0.69 & 1.57\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 1218 & 181 & 11 & 30 & 0 & 3.91 & 0.40 & 2.44\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 &  726 & 209 & 34 & 29 & 0 & 2.83 & 1.26 & 2.14\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 &  773 & 221 & 10 & 36 & 0 & 5.04 & 0.41 & 2.71\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 &  539 & 164 & 20 & 38 & 0 & 2.51 & 0.78 & 3.19\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | sedentaryminutes &lt;int&gt; | lightlyactiveminutes &lt;int&gt; | fairlyactiveminutes &lt;int&gt; | veryactiveminutes &lt;int&gt; | sedentaryactivedistance &lt;dbl&gt; | lightactivedistance &lt;dbl&gt; | moderatelyactivedistance &lt;dbl&gt; | veryactivedistance &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 |  728 | 328 | 13 | 25 | 0 | 6.06 | 0.55 | 1.88 |\n",
       "| 2 | 1503960366 | 2016-04-13 |  776 | 217 | 19 | 21 | 0 | 4.71 | 0.69 | 1.57 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 1218 | 181 | 11 | 30 | 0 | 3.91 | 0.40 | 2.44 |\n",
       "| 4 | 1503960366 | 2016-04-15 |  726 | 209 | 34 | 29 | 0 | 2.83 | 1.26 | 2.14 |\n",
       "| 5 | 1503960366 | 2016-04-16 |  773 | 221 | 10 | 36 | 0 | 5.04 | 0.41 | 2.71 |\n",
       "| 6 | 1503960366 | 2016-04-17 |  539 | 164 | 20 | 38 | 0 | 2.51 | 0.78 | 3.19 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       sedentaryminutes lightlyactiveminutes\n",
       "1 1503960366 2016-04-12  728             328                 \n",
       "2 1503960366 2016-04-13  776             217                 \n",
       "3 1503960366 2016-04-14 1218             181                 \n",
       "4 1503960366 2016-04-15  726             209                 \n",
       "5 1503960366 2016-04-16  773             221                 \n",
       "6 1503960366 2016-04-17  539             164                 \n",
       "  fairlyactiveminutes veryactiveminutes sedentaryactivedistance\n",
       "1 13                  25                0                      \n",
       "2 19                  21                0                      \n",
       "3 11                  30                0                      \n",
       "4 34                  29                0                      \n",
       "5 10                  36                0                      \n",
       "6 20                  38                0                      \n",
       "  lightactivedistance moderatelyactivedistance veryactivedistance\n",
       "1 6.06                0.55                     1.88              \n",
       "2 4.71                0.69                     1.57              \n",
       "3 3.91                0.40                     2.44              \n",
       "4 2.83                1.26                     2.14              \n",
       "5 5.04                0.41                     2.71              \n",
       "6 2.51                0.78                     3.19              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>step_total</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>10460</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td>12669</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & id & date & step\\_total\\\\\n",
       "  & <dbl> & <date> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 10460\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 &  9762\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 & 12669\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 &  9705\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | step_total &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 10460 |\n",
       "| 4 | 1503960366 | 2016-04-15 |  9762 |\n",
       "| 5 | 1503960366 | 2016-04-16 | 12669 |\n",
       "| 6 | 1503960366 | 2016-04-17 |  9705 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       step_total\n",
       "1 1503960366 2016-04-12 13162     \n",
       "2 1503960366 2016-04-13 10735     \n",
       "3 1503960366 2016-04-14 10460     \n",
       "4 1503960366 2016-04-15  9762     \n",
       "5 1503960366 2016-04-16 12669     \n",
       "6 1503960366 2016-04-17  9705     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>totalsleeprecords</th><th scope=col>totalminutesasleep</th><th scope=col>totaltimeinBed</th><th scope=col>mins_awake_in_bed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>1</td><td>327</td><td>346</td><td>19</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>2</td><td>384</td><td>407</td><td>23</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td>1</td><td>412</td><td>442</td><td>30</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>2</td><td>340</td><td>367</td><td>27</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td>1</td><td>700</td><td>712</td><td>12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>1</td><td>304</td><td>320</td><td>16</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & id & date & totalsleeprecords & totalminutesasleep & totaltimeinBed & mins\\_awake\\_in\\_bed\\\\\n",
       "  & <dbl> & <date> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 1 & 327 & 346 & 19\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 2 & 384 & 407 & 23\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 & 1 & 412 & 442 & 30\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 2 & 340 & 367 & 27\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 & 1 & 700 & 712 & 12\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 1 & 304 & 320 & 16\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 6\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | totalsleeprecords &lt;int&gt; | totalminutesasleep &lt;int&gt; | totaltimeinBed &lt;int&gt; | mins_awake_in_bed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 1 | 327 | 346 | 19 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 2 | 384 | 407 | 23 |\n",
       "| 3 | 1503960366 | 2016-04-15 | 1 | 412 | 442 | 30 |\n",
       "| 4 | 1503960366 | 2016-04-16 | 2 | 340 | 367 | 27 |\n",
       "| 5 | 1503960366 | 2016-04-17 | 1 | 700 | 712 | 12 |\n",
       "| 6 | 1503960366 | 2016-04-19 | 1 | 304 | 320 | 16 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       totalsleeprecords totalminutesasleep totaltimeinBed\n",
       "1 1503960366 2016-04-12 1                 327                346           \n",
       "2 1503960366 2016-04-13 2                 384                407           \n",
       "3 1503960366 2016-04-15 1                 412                442           \n",
       "4 1503960366 2016-04-16 2                 340                367           \n",
       "5 1503960366 2016-04-17 1                 700                712           \n",
       "6 1503960366 2016-04-19 1                 304                320           \n",
       "  mins_awake_in_bed\n",
       "1 19               \n",
       "2 23               \n",
       "3 30               \n",
       "4 27               \n",
       "5 12               \n",
       "6 16               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>weight_kg</th><th scope=col>weight_pounds</th><th scope=col>fat</th><th scope=col>bmi</th><th scope=col>ismanualreport</th><th scope=col>log_id</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-05-02</td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td> TRUE</td><td>1.462234e+12</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-05-03</td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td> TRUE</td><td>1.462320e+12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1927972279</td><td>2016-04-13</td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>FALSE</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2873212765</td><td>2016-04-21</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td> TRUE</td><td>1.461283e+12</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2873212765</td><td>2016-05-12</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td> TRUE</td><td>1.463098e+12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>4319703577</td><td>2016-04-17</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td> TRUE</td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & id & date & weight\\_kg & weight\\_pounds & fat & bmi & ismanualreport & log\\_id\\\\\n",
       "  & <dbl> & <date> & <dbl> & <dbl> & <int> & <dbl> & <lgl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-05-02 &  52.6 & 115.9631 & 22 & 22.65 &  TRUE & 1.462234e+12\\\\\n",
       "\t2 & 1503960366 & 2016-05-03 &  52.6 & 115.9631 & NA & 22.65 &  TRUE & 1.462320e+12\\\\\n",
       "\t3 & 1927972279 & 2016-04-13 & 133.5 & 294.3171 & NA & 47.54 & FALSE & 1.460510e+12\\\\\n",
       "\t4 & 2873212765 & 2016-04-21 &  56.7 & 125.0021 & NA & 21.45 &  TRUE & 1.461283e+12\\\\\n",
       "\t5 & 2873212765 & 2016-05-12 &  57.3 & 126.3249 & NA & 21.69 &  TRUE & 1.463098e+12\\\\\n",
       "\t6 & 4319703577 & 2016-04-17 &  72.4 & 159.6147 & 25 & 27.45 &  TRUE & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | weight_kg &lt;dbl&gt; | weight_pounds &lt;dbl&gt; | fat &lt;int&gt; | bmi &lt;dbl&gt; | ismanualreport &lt;lgl&gt; | log_id &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-05-02 |  52.6 | 115.9631 | 22 | 22.65 |  TRUE | 1.462234e+12 |\n",
       "| 2 | 1503960366 | 2016-05-03 |  52.6 | 115.9631 | NA | 22.65 |  TRUE | 1.462320e+12 |\n",
       "| 3 | 1927972279 | 2016-04-13 | 133.5 | 294.3171 | NA | 47.54 | FALSE | 1.460510e+12 |\n",
       "| 4 | 2873212765 | 2016-04-21 |  56.7 | 125.0021 | NA | 21.45 |  TRUE | 1.461283e+12 |\n",
       "| 5 | 2873212765 | 2016-05-12 |  57.3 | 126.3249 | NA | 21.69 |  TRUE | 1.463098e+12 |\n",
       "| 6 | 4319703577 | 2016-04-17 |  72.4 | 159.6147 | 25 | 27.45 |  TRUE | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       weight_kg weight_pounds fat bmi   ismanualreport\n",
       "1 1503960366 2016-05-02  52.6     115.9631      22  22.65  TRUE         \n",
       "2 1503960366 2016-05-03  52.6     115.9631      NA  22.65  TRUE         \n",
       "3 1927972279 2016-04-13 133.5     294.3171      NA  47.54 FALSE         \n",
       "4 2873212765 2016-04-21  56.7     125.0021      NA  21.45  TRUE         \n",
       "5 2873212765 2016-05-12  57.3     126.3249      NA  21.69  TRUE         \n",
       "6 4319703577 2016-04-17  72.4     159.6147      25  27.45  TRUE         \n",
       "  log_id      \n",
       "1 1.462234e+12\n",
       "2 1.462320e+12\n",
       "3 1.460510e+12\n",
       "4 1.461283e+12\n",
       "5 1.463098e+12\n",
       "6 1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "24"
      ],
      "text/latex": [
       "24"
      ],
      "text/markdown": [
       "24"
      ],
      "text/plain": [
       "[1] 24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "8"
      ],
      "text/latex": [
       "8"
      ],
      "text/markdown": [
       "8"
      ],
      "text/plain": [
       "[1] 8"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "daily_activity <- daily_activity %>%\n",
    "  rename(date = activitydate) %>%\n",
    "  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n",
    "\n",
    "daily_calories <- daily_calories %>%\n",
    "  rename(date = activityday) %>%\n",
    "  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n",
    "\n",
    "daily_intensities <- daily_intensities %>%\n",
    "  rename(date = activityday) %>%\n",
    "  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n",
    "\n",
    "daily_steps <- daily_steps %>%\n",
    "  rename(date = activityday) %>%\n",
    "  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n",
    "\n",
    "daily_sleep <- sleep_day %>%\n",
    "  rename(date = sleepday) %>%\n",
    "  mutate(date = as_date(date,format =\"%m/%d/%Y\"))\n",
    "\n",
    "weight_loginfo <- weight_loginfo %>%\n",
    "  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n",
    "\n",
    "\n",
    "\n",
    "head(daily_activity)\n",
    "head(daily_calories)\n",
    "head(daily_intensities)\n",
    "head(daily_steps)\n",
    "head(daily_sleep)\n",
    "head(weight_loginfo)\n",
    "\n",
    "\n",
    "\n",
    "n_distinct(daily_activity$id)\n",
    "n_distinct(daily_calories$id)\n",
    "n_distinct(daily_intensities$id)\n",
    "n_distinct(daily_steps$id)\n",
    "n_distinct(daily_sleep$id)\n",
    "n_distinct(weight_loginfo$id)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "13f3593e",
   "metadata": {
    "papermill": {
     "duration": 0.006341,
     "end_time": "2022-11-18T23:51:04.459818",
     "exception": false,
     "start_time": "2022-11-18T23:51:04.453477",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Basic Data Exploration\n",
    "I then carried on with exploration of the data,in this process;I explored the statistical properties of the tables;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "4ac64ef2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-18T23:51:04.475690Z",
     "iopub.status.busy": "2022-11-18T23:51:04.473958Z",
     "iopub.status.idle": "2022-11-18T23:51:04.562569Z",
     "shell.execute_reply": "2022-11-18T23:51:04.560875Z"
    },
    "papermill": {
     "duration": 0.098681,
     "end_time": "2022-11-18T23:51:04.564741",
     "exception": false,
     "start_time": "2022-11-18T23:51:04.466060",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   totalsteps    totaldistance    sedentaryminutes    calories   \n",
       " Min.   :    0   Min.   : 0.000   Min.   :   0.0   Min.   :   0  \n",
       " 1st Qu.: 3790   1st Qu.: 2.620   1st Qu.: 729.8   1st Qu.:1828  \n",
       " Median : 7406   Median : 5.245   Median :1057.5   Median :2134  \n",
       " Mean   : 7638   Mean   : 5.490   Mean   : 991.2   Mean   :2304  \n",
       " 3rd Qu.:10727   3rd Qu.: 7.713   3rd Qu.:1229.5   3rd Qu.:2793  \n",
       " Max.   :36019   Max.   :28.030   Max.   :1440.0   Max.   :4900  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "    calories   \n",
       " Min.   :   0  \n",
       " 1st Qu.:1828  \n",
       " Median :2134  \n",
       " Mean   :2304  \n",
       " 3rd Qu.:2793  \n",
       " Max.   :4900  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       " sedentaryminutes veryactiveminutes fairlyactiveminutes lightlyactiveminutes\n",
       " Min.   :   0.0   Min.   :  0.00    Min.   :  0.00      Min.   :  0.0       \n",
       " 1st Qu.: 729.8   1st Qu.:  0.00    1st Qu.:  0.00      1st Qu.:127.0       \n",
       " Median :1057.5   Median :  4.00    Median :  6.00      Median :199.0       \n",
       " Mean   : 991.2   Mean   : 21.16    Mean   : 13.56      Mean   :192.8       \n",
       " 3rd Qu.:1229.5   3rd Qu.: 32.00    3rd Qu.: 19.00      3rd Qu.:264.0       \n",
       " Max.   :1440.0   Max.   :210.00    Max.   :143.00      Max.   :518.0       \n",
       " lightactivedistance moderatelyactivedistance veryactivedistance\n",
       " Min.   : 0.000      Min.   :0.0000           Min.   : 0.000    \n",
       " 1st Qu.: 1.945      1st Qu.:0.0000           1st Qu.: 0.000    \n",
       " Median : 3.365      Median :0.2400           Median : 0.210    \n",
       " Mean   : 3.341      Mean   :0.5675           Mean   : 1.503    \n",
       " 3rd Qu.: 4.782      3rd Qu.:0.8000           3rd Qu.: 2.053    \n",
       " Max.   :10.710      Max.   :6.4800           Max.   :21.920    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "   step_total   \n",
       " Min.   :    0  \n",
       " 1st Qu.: 3790  \n",
       " Median : 7406  \n",
       " Mean   : 7638  \n",
       " 3rd Qu.:10727  \n",
       " Max.   :36019  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       " totalsleeprecords totalminutesasleep totaltimeinBed  mins_awake_in_bed\n",
       " Min.   :1.000     Min.   : 58.0      Min.   : 61.0   Min.   :  0.00   \n",
       " 1st Qu.:1.000     1st Qu.:361.0      1st Qu.:403.0   1st Qu.: 17.00   \n",
       " Median :1.000     Median :433.0      Median :463.0   Median : 25.00   \n",
       " Mean   :1.119     Mean   :419.5      Mean   :458.6   Mean   : 39.17   \n",
       " 3rd Qu.:1.000     3rd Qu.:490.0      3rd Qu.:526.0   3rd Qu.: 40.00   \n",
       " Max.   :3.000     Max.   :796.0      Max.   :961.0   Max.   :371.00   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "   weight_kg           bmi       \n",
       " Min.   : 52.60   Min.   :21.45  \n",
       " 1st Qu.: 61.40   1st Qu.:23.96  \n",
       " Median : 62.50   Median :24.39  \n",
       " Mean   : 72.04   Mean   :25.19  \n",
       " 3rd Qu.: 85.05   3rd Qu.:25.56  \n",
       " Max.   :133.50   Max.   :47.54  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Daily activity\n",
    "daily_activity %>%  \n",
    "  select(totalsteps,\n",
    "         totaldistance,\n",
    "         sedentaryminutes, calories) %>%\n",
    "  summary()\n",
    "\n",
    "\n",
    "#Calories\n",
    "daily_calories %>%\n",
    "  select(calories) %>%\n",
    "  summary()\n",
    "\n",
    "\n",
    "# Active minutes per category\n",
    "daily_intensities %>%\n",
    "  select(sedentaryminutes ,veryactiveminutes, fairlyactiveminutes, lightlyactiveminutes ,lightactivedistance,moderatelyactivedistance,veryactivedistance) %>%\n",
    "  summary()\n",
    "\n",
    "\n",
    "# Steps\n",
    "daily_steps %>%\n",
    "  select(step_total) %>%\n",
    "  summary()\n",
    "\n",
    "\n",
    "# Sleep\n",
    "daily_sleep %>%\n",
    "  select(totalsleeprecords, totalminutesasleep, totaltimeinBed , mins_awake_in_bed) %>%\n",
    "  summary()\n",
    "\n",
    "\n",
    "# Weight\n",
    "weight_loginfo %>%\n",
    "  select(weight_kg, bmi) %>%\n",
    "  summary()\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.467776,
   "end_time": "2022-11-18T23:51:04.691407",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-11-18T23:50:59.223631",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
