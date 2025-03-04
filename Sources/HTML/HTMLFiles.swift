//
//  File.swift
//  
//
//  Created by 김대희 on 2023/05/01.
//

import Foundation

public var htmlfile = """
<!-- Source: https://github.com/youtube/youtube-ios-player-helper/blob/ff5991e6e3188867fe2738aa92913a37127f8f1d/youtube-ios-player-helper/Assets.bundle/Assets/YTPlayerView-iframe-player.html -->
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <style>
        body {
            margin: 0;
            width: 100%;
            height: 100%;
        }

        html {
            width: 100%;
            height: 100%;
        }

        .embed-container iframe,
        .embed-container object,
        .embed-container embed {
            position: absolute;
            top: 0;
            left: 0;
            width: 100% !important;
            height: 100% !important;
        }
        ::-webkit-scrollbar {
            display: none !important;
        }
    </style>
</head>

<body>
    <!-- YouTube Player iFrame Container -->
    <div class="embed-container">
        <div id="player"></div>
    </div>
    <!-- YouTube iFrame JS API -->
    <script src="https://www.youtube.com/iframe_api"
        onerror="window.location.href='youtubeplayer://onIframeAPIFailedToLoad">
    </script>
    <!-- Custom JS -->
    <script>
        // The YouTube Player instance
        var player;

        // Configure YouTube Player
        window.YT.ready(() => {
            // Initialize YouTube Player
            // The second parameter will be replaced during runtime
            player = new window.YT.Player(
                'player',
                %@
            );
            // Set initial size
            player.setSize(
                window.innerWidth,
                window.innerHeight
            );
            // Send onIframeAPIReady event
            sendYouTubePlayerEvent('onIframeAPIReady');
        });

        // Set YouTubePlayer Size
        function setYouTubePlayerSize(width, height) {
            // Check if YouTubePlayer is available
            if (player) {
                // Set Player size
                player.setSize(
                    width,
                    height
                );
            }
        }

        // Send YouTubePlayer Event with optional data
        function sendYouTubePlayerEvent(event, data) {
            var locationHref = 'youtubeplayer://' + event;
            if (data) {
                locationHref = locationHref + '?data=' + data;
            }
            window.location.href = locationHref
        }

        // YouTube Player onReady event callback
        function onReady(event) {
            // Send onReady event
            sendYouTubePlayerEvent('onReady');
        }

        // YouTube Player onStateChange event callback
        function onStateChange(event) {
            // Send onStateChange event
            sendYouTubePlayerEvent('onStateChange', event.data);
        }

        // YouTube Player onPlaybackQualityChange event callback
        function onPlaybackQualityChange(event) {
            // Send onPlaybackQualityChange event
            sendYouTubePlayerEvent('onPlaybackQualityChange', event.data);
        }

        // YouTube Player onPlaybackRateChange event callback
        function onPlaybackRateChange(event) {
            // Send onPlaybackRateChange event
            sendYouTubePlayerEvent('onPlaybackRateChange', event.data);
        }

        // YouTube Player onError event callback
        function onError(event) {
            // Send onError error
            sendYouTubePlayerEvent('onError', event.data);
        }
    </script>
</body>

</html>

"""
