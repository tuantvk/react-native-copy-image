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
    "copy-image": "bash scripts/react-native-copy-image/copy_image.sh", // add here
}
```

Finally, from root project run:

```bash
yarn run copy-image

# or
# npm run copy-image
```


### Example

This is example for image name _apple.png_

```js
import React from 'react';
import { View, Image } from 'react-native';


const Example = () => (
    <View>
        <Image
            source={{ uri: 'apple' }}
            style={{ width: 50, height: 50 }}
        />
    </View>
);

export default Example;
```


## LICENSE

MIT