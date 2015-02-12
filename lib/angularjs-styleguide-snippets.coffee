AngularjsStyleguideSnippetsView = require './angularjs-styleguide-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = AngularjsStyleguideSnippets =
  angularjsStyleguideSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @angularjsStyleguideSnippetsView = new AngularjsStyleguideSnippetsView(state.angularjsStyleguideSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @angularjsStyleguideSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'angularjs-styleguide-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @angularjsStyleguideSnippetsView.destroy()

  serialize: ->
    angularjsStyleguideSnippetsViewState: @angularjsStyleguideSnippetsView.serialize()

  toggle: ->
    console.log 'AngularjsStyleguideSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
