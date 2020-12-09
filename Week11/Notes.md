# Photo OCR

## Pipeline
Image -> Text detection -> Character segmentation -> Character recognition

### Sliding window
  - Strides

### Artificial data synthesis
  generating random training data to enrich our problem

  - using random letters with random backgrounds
  - using Artificial distortions to increase the number of samples from an original example.


## On getting more data:
1. make sure you have a low bias classifier before expanding the effort. (Plot learning curves).
2. "How much work would it be to get 10x as much data as we currently have?"
  - Artificial data synthesis
  - collect / label it yourself
  - "Crowd source" (E.g Amazon Mechanical Turk)

## Ceiling analysis
Ex.
  - Overall system: 72% accuracy
  - Text detection: 89% (Manually label the images and test at 100% accuracy)
  - Character segmentation: 90% (Manually label the segments and test at 100% accuracy)
  - Character recognition: 100% (Manually label the segments and test at 100% accuracy)


1000,1000
100, 100= 10,000
50,50= 2500

10$/hour
4 labels / minute
240 / hour -> 10
10,00 /24
250/6
125/3
42
