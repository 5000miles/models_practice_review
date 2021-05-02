# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Streamlit Lab

Being able to take the data science methods and tools we have learned and create a frontend, user-friendly web application can be an extremely valuable skill. Your job for Lab 7.02 is to build a frontend application in Streamlit which utilizes a saved version of your **Project 3 Classification Model** to generate predictions on input text. The goal of the application will be to take in user text, and output a clean, user-friendly prediction indicating which of your two subreddits that text was most likely to come from.

## Materials We Provide

| Topic | Description | Link |
| --- | --- | --- |
| App Skeleton |  app.py file where you will build your Streamlit App | [Link](./app.py)|


## Tips
- You can create a pickled version of your best P3 model in Jupyter Lab, so we recommend creating a "dummy" version of your app in Jupyter that is able to take in text input and output a prediction as expected. You can then adapt this in a way that works with a Streamlit application.
- You will need your pickled model(s) to be in the directory for this lab so that in theory, if someone downloaded your app repo they could open and run your app without a problem.
- Since this is a frontend application, we encourage you to also get creative and add your own personal style to it! Give your user a personalized message, make your prediction output a bit more interesting. 
- For tips on all the various options Streamlit has for user input, check out this [cheat sheet.](https://share.streamlit.io/daniellewisdl/streamlit-cheat-sheet/master/app.py)


## *Bonus: Deployment*
- As a bonus, we encourage you to actually deploy this app, such that it will become publicly available to anyone with the link!
- The best way to do this is to use [Streamlit Share](https://streamlit.io/sharing), for which you will need to request an invite. Once you do, you will need to add a requirements.txt file to your repo. All this needs to include is an indication of all the libraries someone would need to have to run this application, and the version. The format would look like this:
  - pandas==1.2.3
  - numpy==1.2.3
  
  ...with each library on one line. Then you can simply click Streamlit's option to deploy your app.
  
  
## The Submission
 Your submission for this lab should be at least your repo for your Streamlit application including the app.py file and a .pkl model. Additionally, if you deploy your model, you can also submit the link to your deployed model.
