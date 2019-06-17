import React from 'react';
import { requireNativeComponent, Image } from 'react-native';

const RNZoomableImage = requireNativeComponent('RNZoomableImage');

const RNZoomableImageView = (props) => {
  const source = Image.resolveAssetSource(props.source);

  return (
    <RNZoomableImage
      style={props.style}
      source={source}
    />
  );
};

export default RNZoomableImageView;
