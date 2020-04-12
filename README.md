# react-native-copy-image

Copy images for Android and iOS in React Native, use image from local project.


## Install


- #### Create scripts folder

Create folder __scripts/__ from root project.


- #### Clone project

```bash
cd scripts
git clone https://github.com/tuantvk/react-native-copy-image.git
```


## Usage

Make sure folder images in __rootProject/assets/images/__

Add script in __package.json__

```json
"scripts": {
    ....
    "copy-image": "bash scripts/react-native-copy-image/copy_image.sh",
}
```

From root project run:

```bash
yarn run copy-image

# or
# npm run copy-image
```


### Example

```js
import React from 'react';
import { View, Image } from 'react-native';


const Example = () => (
    <View>
        <Image
            source={{ uri: 'example.png '}}
        />
    </View>
);

export default Example;
```


## LICENSE

MIT