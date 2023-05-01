import Foundation

// MARK: - YouTubePlayer+HTML

extension YouTubePlayer {
    
    /// The YouTubePlayer HTML
    struct HTML: Hashable {
        
        /// The HTML contents
        let contents: String
        
    }
    
}

// MARK: - HTML+init

extension YouTubePlayer.HTML {
    
    /// Creates a new instance of `YouTubePlayer.HTML` or throws an error
    /// - Parameters:
    ///   - options: The YouTubePlayer Options
    ///   - bundle: The Bundle. Default value `.module`
    ///   - resource: The Resource. Default value `.default`
    init(
        options: YouTubePlayer.Options,
        resource: Resource = .default
    ) throws {
        // Retrieve the HTML contents from the resource url
        var htmlContents = htmlfile
        // Format HTML contents string
        // with YouTubePlayer Options JSON
        htmlContents = .init(
            format: htmlContents,
            options.json
        )
        // Initialize HTML contents
        self.contents = htmlContents
    }
    
}
