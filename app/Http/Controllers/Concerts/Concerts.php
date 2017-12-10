<?php namespace App\Http\Controllers\Concerts;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yangqi\Htmldom\Htmldom;

class Concerts extends Controller {

    public function index(Request $request)
    {
        $html = new Htmldom("https://afisha.tut.by/concert");
        $list = $html->find('.events-block', 0);//->find('.lists__li', 0);
        $i = 0;
        $lists_li = $list->find('.lists__li');
        foreach ($lists_li as $li)
        {
            $url = $li->find(".media", 0)->href;
            //$url = $media->href;
            $img = $li->find("img", 0)->src;
            $name = $li->find("span[itemprop=summary]", 0)->innertext;
            $where = $li->find(".txt p", 0)->innertext;
            $lists[$i] = [
                'url' => $url,
                'img' => $img,
                'name' => $name,
                'where' => $where
            ];
            $where = preg_split('/\,\s/', $where);
            $location_id = EventLocations::Create($where[0]);
            Events::Create($name, $where[1], $location_id, $img, $url);
            $i++;
        }

        $dateTable = $html->find(".date_table", 0);
        $i = 0;
        foreach ($dateTable->find("td div") as $dateBlock)
        {
            if($i == 40)
                break;
            if($dateBlock->class == "date" || $dateBlock->class == "date free_day")
            {
                $dateBlock = $dateBlock->find("a", 0);
                $href = $dateBlock->href;
                preg_match('@(?=\s*)\d+@i', $dateBlock->innertext, $text);
                $href = preg_replace('@https\:\/\/afisha\.tut\.by\/day\/concert\/@i', "", $href);
                $dateBlocks[$i] = [
                    'text' => $text[0],
                    'url' => $href
                ];
            }
            else if($dateBlock->class == "month")
            {
                $dateBlocks[$i] = [
                    'text' => $dateBlock->find("span", 0)->innertext,
                    'url' => ""
                ];
            }
            $i++;
        }
//        dd($dateBlocks);


        $currentDate = $html->find(".current_date a", 0)->title;

        $data = [
            'title' => 'Concerts',
            'concertLists' => $lists,
            'styles' => [
                'concerts.css'
            ],
            'dateBlocks' => $dateBlocks,
            'currentDate' => $currentDate
        ];

        if($request->ajax())
            return view('pages.concerts.concerts', $data);
        else
            return view('pages.concerts.concerts-section', $data);
    }

    public function getConcerts()
    {
        $date = date_create_from_format('Y/m/j/', str_replace('http://afisha.tut.by/day/concert/', '', $_POST['pageUrl']));
        $html = new Htmldom($_POST['pageUrl']);
        $list = $html->find('.events-block', 0);
        $i = 0;
        $lists = array();
        $lists_li = $list->find('.lists__li');
        foreach ($lists_li as $li)
        {
            $url = $li->find(".media", 0)->href;
            //$url = $media->href;
            $img = $li->find("img", 0)->src;
            $name = $li->find("span[itemprop=summary]", 0)->innertext;
            $where = $li->find(".txt p", 0)->innertext;
            $lists[$i] = [
                'url' => $url,
                'img' => $img,
                'name' => $name,
                'where' => $where
            ];
            $where = preg_split('/\,\s/', $where);
            $location_id = EventLocations::Create($where[0]);
            Events::Create($name, $where[1], $location_id, $img, $url, $date);
            $i++;
        }
        return json_encode($lists);
    }
}