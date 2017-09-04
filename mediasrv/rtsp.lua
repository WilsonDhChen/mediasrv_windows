
require("string")
require("io")

config.record.settsenable(false)
config.record.setflvenable(false)
config.record.setmp4enable(false)

print("��rtsp.lua�ļ����������NVR");
_RECORD_TYPE="nvr"
_RECORD_DIR="D:/video/record/"
_RECORD_DUR=1600
config.record.setformat("mp4");
config.record.settype(_RECORD_TYPE)
config.record.setduration(_RECORD_DUR)

config.record.setmp4enable(false)
config.record.setmp4path(_RECORD_DIR)


function OnStarted(   )
	print("��rtsp.lua�ļ������RTSPֱ��Դ");
	-----������һ��ʾ��,������Ӷ��
--	streampull.add("stream1",1,1,"rtsp://192.168.1.101/");
	streampull.add_with_args("stream2",1,1,"-loglevel",0,"-re","-i","D:/video/error.mp4",nil);
--	streampull.add_ffmpeg("stream3",1,1,дffmpeg�Ĳ���);


	return 0 ;
end

function OnStoped(   )

	return 0 ;
end

function StreamSnapshot(app, streamid,url , imagefile)

local sid = "F_"..imagefile
streampull.add_ffmpeg(sid,1,0,"-probesize",32768,"-i", url, "-y", "-vframes","1","-s","100x100","-f", "image2","-r","1", imagefile);
streampull.waitstop(sid)
streampull.remove(sid);

end