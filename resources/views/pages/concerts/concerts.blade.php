<input type="hidden" name="csrf-token" value="{{ csrf_token() }}">

<div class="container-fluid concerts-container">
    <div class="concerts-filter-container" onselectstart="return false" onmousedown="return false">
        <div class="today-block selected-date">
            <p class="title">Сегодня</p>
            <p class="today-date">{{ $currentDate }}</p>
        </div>
        <div class="slider-prev"><b class="fa fa-angle-left"></b></div>
        <div class="date-slider">
            <div class="slider-items">
                <?php $flag = true; ?>
                @foreach($dateBlocks as $date)
                    @if(!is_numeric($date['text']))
                        @if($flag)
                            <p class="today-month active">{{ $date['text'] }}</p>

                        @else
                            <p class="today-month">{{ $date['text'] }}</p>
                        @endif
                    @else
                        @if($flag)
                            <p class="date first" url="{{ $date['url'] }}">{{ $date['text'] }}</p>
                            <?php $flag = false; ?>
                        @else
                            <p class="date" url="{{ $date['url'] }}">{{ $date['text'] }}</p>
                        @endif
                    @endif
                @endforeach
                <!--<p class="today-month active">November</p>
                <p class="date first">13</p>
                <p class="date">14</p>
                <p class="date">15</p>
                <p class="date">16</p>
                <p class="date">17</p>
                <p class="date">18</p>
                <p class="date">19</p>
                <p class="date">20</p>
                <p class="date">21</p>
                <p class="date">22</p>
                <p class="date">23</p>
                <p class="date">24</p>
                <p class="date">25</p>
                <p class="date">26</p>
                <p class="date">27</p>
                <p class="date">28</p>
                <p class="date">29</p>
                <p class="date">30</p>
                <p class="today-month">December</p>
                <p class="date">1</p>
                <p class="date">2</p>
                <p class="date">3</p>
                <p class="date">4</p>
                <p class="date">5</p>
                <p class="date">6</p>
                <p class="date">7</p>
                <p class="date">8</p>
                <p class="date">9</p>
                <p class="date">10</p>-->
            </div>
        </div>
        <div class="slider-next"><b class="fa fa-angle-right"></b></div>
        <div class="cities-list">
            <p class="city selected-city" info="minsk">Минск</p>
            <p class="city" info="brest">Брест</p>
            <p class="city" info="gomel">Гомель</p>
            <p class="city" info="grodno">Гродно</p>
            <p class="city" info="mogilev">Могилев</p>
            <p class="city" info="vitebsk">Витебск</p>
        </div>
    </div>
    <div class="concerts-items-block">
        <div class="concert-items">
            @if(!empty($concertLists) && is_array($concertLists))
                @foreach($concertLists as $concert)
                    <a href="{{ $concert['url'] }}" target="_blank">
                        <div class="concert-item">
                            <div class="concert-img">
                                <img src="{{ $concert['img'] }}" alt="">
                            </div>
                            <div class="concert-info">
                                <p class="concert-date">{{ $concert['where'] }}</p>
                                <p class="concert-name">{{ $concert['name'] }}</p>
                            </div>
                        </div>
                    </a>
                @endforeach
            @endif
        </div>
        <div class="loading-overlap">
            <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
        </div>
    </div>
</div>