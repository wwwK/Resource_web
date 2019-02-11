module.exports = {
  presets: [
    ['@vue/app', {
      polyfills: [ //Polyfill 是一块代码（通常是 Web 上的 JavaScript），用来为旧浏览器提供它没有原生支持的较新的功能。
        'es6.promise',
        'es6.symbol'
      ]
    }]
  ]
}
