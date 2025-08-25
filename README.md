# React File Icon

A React component to render beautiful svg file icons.

## Installation

First, you'll need a GitHub Personal Access Token with `read:packages` scope. Create one at: [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)

Then configure npm to use GitHub Packages by adding this to your project's `.npmrc`:

```
@recurser:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=YOUR_GITHUB_TOKEN
```

Replace `YOUR_GITHUB_TOKEN` with your actual token.

Then install the package:

```bash
npm install @recurser/react-file-icon --save
# or
yarn add @recurser/react-file-icon
```

## Usage

```js
import { FileIcon } from '@recurser/react-file-icon';
```

## Props

<!-- prettier-ignore-start -->
| Property          | Type   | Default    | Description                       |
|:---               |:---    |:---        |:---                               |
| `color`           | string | `whitesmoke` | Color of icon background          |
| `extension`       | string | `undefined`  | Text to display in label          |
| `fold`            | bool   | `true`       | Displays the corner fold          |
| `foldColor`       | string | `undefined`  | Color of the corner fold          |
| `glyphColor`      | string | `undefined`  | Color of file type icon           |
| `gradientColor`   | string | `white`      | Color of page gradient            |
| `gradientOpacity` | number | `0.25`       | Opacity of page gradient          |
| `labelColor`      | string | `undefined`  | Color of label                    |
| `labelTextColor`  | string | `white`      | Color of label text               |
| `labelUppercase`  | bool   | `false`      | Displays the label in all caps    |
| `radius`          | number | `4`          | Corner radius of the file icon    |
| `type`            | enum   | `undefined`  | Type of glyph icon to display (One of: `3d`, `acrobat`, `android`, `audio`, `binary`, `code`, `compressed`, `document`, `drive`, `font`, `image`, `presentation`, `settings`, `spreadsheet`, `vector`, `video`) |
<!-- prettier-ignore-end -->

## Default Styles

We also export an object of [default styles](https://github.com/corygibbons/react-file-icon/blob/master/src/defaultStyles.js) that can be used as a starting point when rendering icons. Object keys map to file extensions.

```js
import { FileIcon, defaultStyles } from '@recurser/react-file-icon';

// Render a .docx icon with default styles
<FileIcon extension="docx" {...defaultStyles.docx} />;
```

## Publishing a release

```bash
cp .npmrc.example .npmrc
# Add your github token to .npmrc
yarn build
npm publish
```
