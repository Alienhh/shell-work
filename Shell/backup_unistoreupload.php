<?php
/**
 * Created by PhpStorm.
 * User: congying
 * Date: 2015/4/10
 * Time: 11:32
 */

class unistoreupload{

    private $PROJECT = "mmunistore";
    private $SKEY = "zwCMGqLXE8y[RLVTnrJ2QchrxLxVUA@K";
    private $EXPIRES =  3600;

    public function upload_unistore($picname, $content_type = "image/png"){

        echo $content_type;

        $pic_path = $_FILES[$picname]['tmp_name'];
        $pic = file_get_contents($pic_path);
        $content_md5encode = md5($pic);
        echo "md5:   ".$content_md5encode . PHP_EOL;
        $ssig = $this->generateSSIG($content_md5encode, $content_type);
        echo $ssig . "\r\n";
        $expires = $this->EXPIRES + time();

        $expires = 1502879999;

        $url = "http://mm.unistore.service.weibo.com/?KID=unistore,{$this->PROJECT}&Expires={$expires}&ssig={$ssig}";
        $content_length = filesize($pic_path);
        $header = array (
            "Host: mm.unistore.service.weibo.com",
            "Content-Type: {$content_type}",
            "Content-Length: {$content_length}",
            "Content-MD5: {$content_md5encode}"
        );

        var_dump($header);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL , $url);
        curl_setopt ($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 2000);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $pic);



        echo $url;

        $result = curl_exec($ch);

        var_dump(curl_getinfo($ch));
        return $result;
    }

    public function generateSSIG($md5Str, $content_type = "image/png"){
        $expires = $this->EXPIRES + time();

        $expires = 1502879999;

        echo "expires:   ".$expires.PHP_EOL;

        $str_to_sign = "POST\n";
        $str_to_sign .= $md5Str."\n";
        $str_to_sign .= "{$content_type}\n";
        $str_to_sign .= "{$expires}\n";
        $str_to_sign .= "/mm.unistore.service.weibo.com/";
        $hmac = hash_hmac('sha1', $str_to_sign, $this->SKEY, true);
        echo "byte:  " . var_dump(self::getBytes($hmac));
        echo "hash_hmac:   ".$hmac. PHP_EOL;
        echo "base64_encode:   ".base64_encode(hash_hmac('sha1', $str_to_sign, $this->SKEY, true)) . PHP_EOL;

        $ssig = substr(base64_encode(hash_hmac('sha1', $str_to_sign, $this->SKEY, true)), 5, 10);
        echo "ssig:   ".$ssig . PHP_EOL;
        $ssig = urlencode($ssig);
        echo "url_encode:   ".$ssig . PHP_EOL;
        return $ssig;
    }

    public static function getBytes($string) {
        $bytes = array();
        for($i = 0; $i < strlen($string); $i++){
            $bytes[] = ord($string[$i]);
        }
        return $bytes;
    }


}