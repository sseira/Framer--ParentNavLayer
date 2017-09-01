class ParentNavLayer extends Layer

	constructor: (@options={}) -> #sets all our arguments as instance variables automatically	
		@name ?= 'ParentNavLayer'	
		
		@content = if @options.content then  @options.content else new Layer
			backgroundColor: 'white'
		@content.name = 'content'
		@header = if @options.header then  @options.header else new Layer
			height: 64
			backgroundColor: '#3B5998'
		@header.name = 'header'

		@headerShadowColor = if @options.headerShadowColor then  @options.headerShadowColor else ''


		@content.frame = {
			y:@options.header.height, 
			x:0,
			width: Screen.width, 
			height: Screen.height - @options.header.height  
		}
		
		@header.frame = {
			y:0, 
			x:0, 
			width: Screen.width
		}

		super @options
		@.frame = {
			y:0, 
			x:0, 
			height: Screen.height
			width: Screen.width
		}
		@content.parent = @
		@header.parent = @

		@header.shadowY = 1
		@header.shadowBlur = 20 
		@header.shadowColor = @options.headerShadowColor 
	
			
	@define 'name',
		get: ->
			@options.name
		set: (value) ->
			@options.name = value
					
	@define 'header',
		get: ->
			@options.header
		set: (value) ->
			@options.header = value
						
	@define 'content',
		get: ->
			@options.content
		set: (value) ->
			@options.content = value

	@define 'headerShadowColor',
		get: ->
			@options.headerShadowColor
		set: (value) ->
			@options.headerShadowColor = value
			@options.header.shadowColor = @options.headerShadowColor 


	setHeader: (newHeader) ->
		@options.header.destroy()
		@options.header = newHeader
		@options.header.name = 'header'
		@options.header.parent = @
		@options.header.frame = {
				y:0, 
				x:0,
				width: Screen.width, 
			}
		@header.shadowY = 1
		@header.shadowBlur = 20 
		@header.shadowColor = @options.headerShadowColor 
		
		@options.content.frame = {
				y:@options.header.height, 
				x:0,
				width: Screen.width, 
				height: Screen.height - @options.header.height  
			}
				
	setContent: (newContent) ->
		@options.content.destroy()
		@options.content = newContent
		@options.content.name = 'content'
		@options.content.parent = @
		@options.content.frame = {
				y:@options.header.height, 
				x:0,
				width: Screen.width, 
				height: Screen.height - @options.header.height  
			}
			
						
module.exports = ParentNavLayer