<?php
if ( ! function_exists('add_js'))
{
	function add_js($add_js)
	{
		$ci =& get_instance();
		$ci->path_js = $add_js;
	}
	
}

if ( ! function_exists('add_css'))
{
	function add_css($add_css)
	{
		$ci =& get_instance();
		$ci->path_css = $add_css;
	}
}
if ( ! function_exists('asset_js'))
{
	function asset_js()
	{
		$ci =& get_instance();
		$js ='';

		if(!empty($ci->path_js)){

			foreach($ci->path_js as $phat_js){
				$js .= '<script src="'.base_url($phat_js).'" type="text/javascript"></script>';
			}
			
		}
		echo $js;
	}
}
if ( ! function_exists('asset_css'))
{
	function asset_css()
	{
		$ci =& get_instance();
		$css ='';
		if(!empty($ci->path_css)){
			foreach($ci->path_css as $phat_css){
				$css .= '<link href="'.base_url($phat_css).'" rel="stylesheet" type="text/css">';
			}
		}
		echo $css;
	}
}