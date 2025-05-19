<style>
    .stars-card {
        display: none !important;
    }

    .author-price-details {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between; 
    }
</style>

<div class="webinar-card">
    <figure>
        <div class="image-box">
            {{-- <div class="badges-lists">
                @if($webinar->bestTicket() < $webinar->price)
                    <span class="badge badge-danger">{{ trans('public.offer',['off' => $webinar->bestTicket(true)['percent']]) }}</span>
                @elseif(empty($isFeature) and !empty($webinar->feature))
                    <span class="badge badge-warning">{{ trans('home.featured') }}</span>
                @elseif($webinar->type == 'webinar')
                    @if($webinar->start_date > time())
                        <span class="badge badge-primary">{{  trans('panel.not_conducted') }}</span>
                    @elseif($webinar->isProgressing())
                        <span class="badge badge-secondary">{{ trans('webinars.in_progress') }}</span>
                    @else
                        <span class="badge badge-secondary">{{ trans('public.finished') }}</span>
                    @endif
                @elseif(!empty($webinar->type))
                    <span class="badge badge-primary">{{ trans('webinars.'.$webinar->type) }}</span>
                @endif

                @include('web.default.includes.product_custom_badge', ['itemTarget' => $webinar])
            </div> --}}

            <a href="{{ $webinar->getUrl() }}">
                <img src="{{ $webinar->getImage() }}" class="img-cover" alt="{{ $webinar->title }}">
            </a>


            @if($webinar->checkShowProgress())
                <div class="progress">
                    <span class="progress-bar" style="width: {{ $webinar->getProgress() }}%"></span>
                </div>
            @endif

            @if($webinar->type == 'webinar')
                <a href="{{ $webinar->addToCalendarLink() }}" target="_blank" class="webinar-notify d-flex align-items-center justify-content-center">
                    <i data-feather="bell" width="20" height="20" class="webinar-icon"></i>
                </a>
            @endif
        </div>

        <figcaption class="webinar-card-body">
            {{-- <div class="user-inline-avatar d-flex align-items-center">
                <div class="avatar bg-gray200">
                    <img src="{{ $webinar->teacher->getAvatar() }}" class="img-cover" alt="{{ $webinar->teacher->full_name }}">
                </div>
                <a href="{{ $webinar->teacher->getProfileUrl() }}" target="_blank" class="user-name ml-5 font-14">{{ $webinar->teacher->full_name }}</a>
            </div> --}}

            <a href="{{ $webinar->getUrl() }}">
                <h3 class="webinar-title font-weight-bold font-16 text-black">{{ clean($webinar->title,'title') }}</h3>
            </a>

            @include(getTemplate() . '.includes.webinar.rate',['rate' => $webinar->getRate()])

            <div class="author-price-details">
                <a href="{{ $webinar->teacher->getProfileUrl() }}" target="_blank" class="user-name text-secondary-black font-14">{{ $webinar->teacher->full_name }}</a>

                <div class="webinar-price-box">
                    @if(!empty($isRewardCourses) and !empty($webinar->points))
                        <span class="text-warning real font-14">{{ $webinar->points }} {{ trans('update.points') }}</span>
                    @elseif(!empty($webinar->price) and $webinar->price > 0)
                        @if($webinar->bestTicket() < $webinar->price)
                            <span class="real">{{ ($webinar->bestTicket() > 0) ? handlePrice($webinar->bestTicket(), true, true, false, null, true) : trans('public.free') }}</span>
                            <span class="off ml-10">{{ handlePrice($webinar->price, true, true, false, null, true) }}</span>
                        @else
                            <span class="real text-secondary-black">{{ handlePrice($webinar->price, true, true, false, null, true) }}</span>
                        @endif
                    @else
                        <span class="real font-14">{{ trans('public.free') }}</span>
                    @endif
                </div>
            </div>
            
        </figcaption>
    </figure>
</div>
