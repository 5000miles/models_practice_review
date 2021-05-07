import streamlit as st
import pickle
import numpy as np
page = st.sidebar.selectbox(
'Select a page:',
('About', 'Make a prediction')
)

if page == 'About':
    st.title('Which subreddit the post come from?')
    '''
    ## Web APIs & NLP

    ### Description
    This is my NLP project:  I collected text data from 2 subreddits: r/math and r/Physics, \
    then utlizing multiple classifers to classify posts, predicting which subreddit it belongs \
    to base on its title and self text. [You can find my full project here]('https://git.generalassemb.ly/5000miles/Submissions/tree/master/Projects/project_3-master')

    #### API

    > API: [Pushshift's API ]('https://pushshift.io/')


    #### Data Source

    Reddit:
    > * [r/math]('https://www.reddit.com/r/math/'): 1.5m members, Created Jan 24, 2008
    > * [r/Physics]('https://www.reddit.com/r/Physics/'): 1.7m members, Created Mar 16, 2008

    ---

    ### Data info

    - 5000 observations from 11/24/2020 to 3/29/2021 for each subreddit, excluded [removed] and [deleted] posts.
        * Removed posts are results of automod action, probably because those posts triggered a filter.
        * Deleted posts are posts that deleted by the author self.


    - Then combination of tile & selftext is the predictor, subreddit is the response variable.

    ---

    ### Data EDA/ Preprocessing/ Visualization

    - Created distribuition plots for the posts in each subreddit. Clearly see that redditors like to post at around noon for both subreddit.

    - Using `RegexpTokenizer` to tokenize the predictors with Regex: `\w+`
    - Using `WordNetLemmatizer` to lemmatize the predicotrs
    - Combine 2 dateframes(math & physics)

    ### Model building:

    Built 3 models with `GridSearchCV`:

    | Model | Vectorize |
    | --- | --- |
    | **Logistic Regression** | *Using TfidfVectorizer()* |
    | **Random Forest** | *Using TfidfVectorizer()* |
    | **Adaboost** | *Using TfidfVectorizer()* |



    ### Model results:


    | Model | Precision | Recall |
    | --- | --- | --- |
    | **Logistic Regression** | *0.866564* | *0.9040* |
    | **Random Forest** | *0.832969* | *0.9136* |
    | **Adaboost** | *0.793033* | *0.9288* |



    ### Using three models to make prediction on data in different time period.

    100 observations randomly chosen from 3/1/2015 - 9/1/2015, this is out of the time range of the training and testing data.


    | Model | Precision | Recall |
    | --- | --- | --- |
    | **Logistic Regression** | *0.923077* | *0.96* |
    | **Random Forest** | *0.834783* | *0.96* |
    | **Adaboost** | *0.770492* | *0.94* |


    ### Conclusion

    The models are doing pretty good. It could be better if I could use cloud computing to speed up the fitting then I can make more adjusment on the hyperparamters.
    '''






if page == 'Make a prediction':
    model = pickle.load(open('project3.pkl','rb'))
    title = st.text_input("Enter the title of the Reddit post","")


    if title:
        predictor = np.array([title])
        st.write(f'The title you entered is a Reddit Post of')
        st.write(f'{model.predict(predictor)[0]}')
        st.write('subreddit')
