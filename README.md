# @capitual/react-native-store-review

### App review adapter to React Native.
#### **only works on android for native option**
<hr />

## Introduction

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

<hr/>

## Installation

```sh
npm install @capitual/react-native-store-review
```

<hr/>

## Usage

```tsx
import * as React from 'react';
import {
  openCustomReview,
  openNativeReview,
} from '@capitual/react-native-store-review';
import { StyleSheet, View, Text, Alert, TouchableOpacity } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 20,
  },
  button: {
    width: '100%',
    height: 64,
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'black',
    marginVertical: 10,
  },
  text: {
    textAlign: 'center',
    fontSize: 24,
    color: 'white',
  },
});

export default function App() {
  const handleOpenCustomReview = () => {
    try {
      openCustomReview('IOS_APP_ID', 'ANDROID_APP_ID');
    } catch (e) {
      Alert.alert('Error on open  Custom Review');
    }
  };

  const handleOpenNativeReview = async () => {
    try {
      openNativeReview();
    } catch (e) {
      Alert.alert('Error on open  Native Review');
    }
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button} onPress={handleOpenCustomReview}>
        <Text style={styles.text}>Open Custom Review</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={handleOpenNativeReview}>
        <Text style={styles.text}>Open Native Review</Text>
      </TouchableOpacity>
    </View>
  );
}

```

<hr/>

## Contributing

See the [contributing guide](./CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

<hr/>

## License

[MIT License](./LICENSE). 🙂

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob). 😊
