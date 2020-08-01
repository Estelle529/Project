module.exports = {
	publicPath: '/',    // 启动页地址
	outputDir: 'dist', // 打包的目录
	lintOnSave: true, // 在保存时校验格式
	productionSourceMap: false, // 生产环境是否生成SourceMap
	devServer: {
		open: true, // 启动服务是否自动打开浏览器
		host: '0.0.0.0',
		port: 3030, // 端口
		https: false,
		hotOnly: false,
		before: app => { }
	},
}