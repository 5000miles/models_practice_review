# Capstone: Noise Detection & Classify

### Description
For this capstone, using CNN to classify different noise. Not only on the noise it self, but also try to classify them when the nosises combine with my voice.

#### Data Source

[UrbanSound8K:]('https://urbansounddataset.weebly.com/urbansound8k.html')

---

### Data info
 
- 8732 labeled sound excerpts (<=4s) of urban sounds from 10 classes.
    * air_conditioner.
    * car_horn.
    * children_playing.
    * dog_bark.
    * drilling.
    * engine_idling.
    * gun_shot.
    * jackhammer.
    * siren.
    * stree_music
    

---

### Data EDA/ Preprocessing/ Visualization

- Plot wave plot for each class of sound.
- Extract MFCC features from each sound
- Combined with my voice

### Model building:

Built 2 models with `CNN`:

> First Model, classify the noise only, without my voice

| Data | Accuracy | Loss Value | 
| --- | --- | --- |
| **Training Data** | *97.73%* | *0.075* |
| **Testing Data** | *0* | *0.9136* |



### Model results:

> Second Model, classify the noise which is combined with my voice

| Data | Accuracy | Loss Value | 
| --- | --- | --- |
| **Training Data** | *90.42%* | *0.298* |
| **Testing Data** | *85.12%* | *0.456* |


### Conclusion

CNN works perfectly with MFCC feature when dealing with sound. 
However, there are many need to be improve:
1) The model can only classify one noise at a time, (one reponse variable only), I'll try to make it works on detect&classify multiple noise at a time
2) Try to combine more human's voice, (and different gender since the voice's frequency varies a lot among genders)
3) Final project will be able to remove the noise from the sound track.


Credit to:

1) [Understanding Audio data, Fourier Transform, FFT and Spectrogram features for a Speech Recognition System]('https://towardsdatascience.com/understanding-audio-data-fourier-transform-fft-spectrogram-and-speech-recognition-a4072d228520')

2) [Mel Frequency Cepstral Coefficient (MFCC) tutorial]('http://practicalcryptography.com/miscellaneous/machine-learning/guide-mel-frequency-cepstral-coefficients-mfccs/')

3) [Sound Classification using Deep Learning]('https://mikesmales.medium.com/sound-classification-using-deep-learning-8bc2aa1990b7')


