## The Data Scientist
The main idea of getting the flag is using cv2, pandas libraries to get decoded message.

#### Step-1:

https://niekgnad.wordpress.com/2020/07/23/ctflearn-solution-the-data-scientist/

```python

import pandas as pd
import cv2
# The real hint will be given when you found what's the columns mean
df = pd.read_csv('the_data_scientist.csv')
print(''.join([chr(int(round(x))) for x in df.mean()]))
# SET ALL VALUES BETWEEN 64 AND 65 TO BLACK AND SCAN IT
df = (df < 64) | (df > 65)
cv2.imwrite('flag.png', df.to_numpy() * 255);
```

#### Step-2:
Finally, the flag becomes:
`CTFlearn{m4ch1n3_l34rn1n9_rul35}`