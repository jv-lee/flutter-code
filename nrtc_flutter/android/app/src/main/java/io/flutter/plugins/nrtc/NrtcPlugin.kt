package io.flutter.plugins.nrtc

import android.content.Context
import com.netease.nrtc.sdk.EngineConfig
import com.netease.nrtc.sdk.NRtc
import com.netease.nrtc.sdk.audio.AudioFrame
import com.netease.nrtc.sdk.common.VideoFilterParameter
import com.netease.nrtc.sdk.common.statistics.NetStats
import com.netease.nrtc.sdk.common.statistics.RtcStats
import com.netease.nrtc.sdk.common.statistics.SessionStats
import com.netease.nrtc.sdk.video.VideoFrame
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.netease.nrtc.sdk.NRtcCallback as NRtcCallback1

/**
 * @author jv.lee
 * @date 2020-01-18
 * @description
 */
class NrtcPlugin  : FlutterPlugin, MethodChannel.MethodCallHandler, NRtcCallback1 {


    private var context: Context? = null
    private var channel: MethodChannel? = null
    private var nrtc: NRtc? = null

    private fun init(context:Context,channel: MethodChannel){
        this.context = context
        this.channel = channel
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, "nrtc")
        val nrtcPlugin = NrtcPlugin()
        nrtcPlugin.init(flutterPluginBinding.applicationContext,channel)
        channel.setMethodCallHandler(nrtcPlugin)
    }

    override fun onDetachedFromEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "create") {
            val appKey = call.argument<String>("appKey")
            nrtc = NRtc.create(context, appKey, null, EngineConfig.Builder().build(), this)
        } else if (call.method == "dispose") {
            nrtc?.dispose()
            nrtc = null
        } else {
            result.notImplemented()
        }
    }

    override fun onUnsubscribeAudioResult(p0: Int) {
    }

    override fun onUnpublishVideoResult(p0: Int) {
    }

    override fun onLiveEvent(p0: Int) {
    }

    override fun onVideoFrameResolutionChanged(p0: Long, p1: Int, p2: Int, p3: Int) {
    }

    override fun onJoinedChannel(p0: Long, p1: String?, p2: String?, p3: Int) {
    }

    override fun onReportSpeaker(p0: Int, p1: LongArray?, p2: IntArray?, p3: Int) {
    }

    override fun onAudioDeviceChanged(p0: Int, p1: MutableSet<Int>?, p2: Boolean) {
    }

    override fun onVideoCapturerStopped() {
    }

    override fun onAudioEffectPlayEvent(p0: Int, p1: Int) {
    }

    override fun onSessionStats(p0: SessionStats?) {
    }

    override fun onRemoteUnpublishVideo(p0: Long) {
    }

    override fun onVideoFpsReported(p0: Long, p1: Int) {
    }

    override fun onCallEstablished() {
    }

    override fun onAudioMixingProgressUpdated(p0: Long, p1: Long) {
    }

    override fun onSubscribeVideoResult(p0: Long, p1: Int, p2: Int) {
    }

    override fun onUserJoined(p0: Long) {
    }

    override fun onAudioFrameFilter(p0: AudioFrame?): Boolean {
        return false
    }

    override fun onNetworkQuality(p0: Long, p1: Int, p2: NetStats?) {
    }

    override fun onVideoFrameFilter(p0: VideoFrame?, p1: Array<out VideoFrame>?, p2: VideoFilterParameter?): Boolean {
        return false
    }

    override fun onVideoFrameFilter(p0: com.netease.nrtc.sdk.common.VideoFrame?, p1: Boolean): Boolean {
        return false
    }

    override fun onVideoCapturerStarted(p0: Boolean) {
    }

    override fun onUserMuteVideo(p0: Long, p1: Boolean) {
    }

    override fun onRemotePublishVideo(p0: Long, p1: IntArray?) {
    }

    override fun onLeftChannel(p0: SessionStats?) {
    }

    override fun onUnsubscribeVideoResult(p0: Long, p1: Int, p2: Int) {
    }

    override fun onSubscribeAudioResult(p0: Int) {
    }

    override fun onUserMuteAudio(p0: Long, p1: Boolean) {
    }

    override fun onAudioEffectPreload(p0: Int, p1: Int) {
    }

    override fun onDeviceEvent(p0: Int, p1: String?) {
    }

    override fun onConnectionTypeChanged(p0: Int) {
    }

    override fun onUserLeft(p0: Long, p1: RtcStats?, p2: Int) {
    }

    override fun onFirstVideoFrameAvailable(p0: Long) {
    }

    override fun onPublishVideoResult(p0: Int) {
    }

    override fun onError(p0: Int, p1: Int) {
    }

    override fun onUserEnableVideo(p0: Long, p1: Boolean) {
    }

    override fun onFirstVideoFrameRendered(p0: Long) {
    }
}