const path = require('path');
const baseConfig = require('./webpack.base.config');
const merge = require('webpack-merge');

const packageName = 'tshtml';
const libraryTarget = [{
    type: "var",
    name: `${packageName}.js`
}, {
    type: "commonjs2",
    name: `${[packageName]}.commonjs2.js`
}];

function getConfigForTaget(target) {
    return {
        devtool: 'source-map',
        output: {
            path: path.join(__dirname, "./../output"),
            filename: target.name,
            library: packageName,
            libraryTarget: target.type
        }
    }
}

function createConfigsForAllLibraryTarget() {
    var configs = [];
    libraryTarget.forEach(function (target) {
        configs.push(merge(baseConfig[0], getConfigForTaget(target)));
    })
    return configs;
}

module.exports = [...createConfigsForAllLibraryTarget()]