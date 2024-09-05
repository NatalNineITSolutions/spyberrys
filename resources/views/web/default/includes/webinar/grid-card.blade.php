<div class="webinar-card" style="height: 500px; cursor: pointer;">
    <figure>
        <div class="image-box">
            <div class="badges-lists">
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
            </div>

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

        <figcaption class="webinar-card-body d-flex" style="flex-direction: column; gap:12px;">
            <a href="{{ $webinar->getUrl() }}" class="title">
                <h4 class="webinar-title">{{ clean($webinar->title,'title') }}</h4>
                <img src="/assets/default/img/classes/arrow-up-right.png" alt="">
            </a>

            <p class="description mt-0">
                @if($webinar->translations->isNotEmpty())
                    {{ \Illuminate\Support\Str::limit(strip_tags($webinar->translations->firstWhere('locale', app()->getLocale())->description), 200) }}
                @endif
            </p>

            {{-- @if(!empty($webinar->category))
                <span class="d-block font-14 mt-10">{{ trans('public.in') }} <a href="{{ $webinar->category->getUrl() }}" target="_blank" class="text-decoration-underline">{{ $webinar->category->title }}</a></span>
            @endif --}}

            {{-- @include(getTemplate() . '.includes.webinar.rate',['rate' => $webinar->getRate()]) --}}

            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center" style="gap: 6px;">
                    <i data-feather="clock" width="20" height="20" class="webinar-icon"></i>
                    <span class="duration font-12">{{ convertMinutesToHourAndMinute($webinar->duration) }} {{ trans('home.hours') }}</span>
                </div>

                <div class="vertical-line mx-15"></div>

                <div class="d-flex align-items-center" style="gap: 6px;">
                    <i data-feather="calendar" width="20" height="20" class="webinar-icon"></i>
                    <span class="date-published font-12">{{ dateTimeFormat(!empty($webinar->start_date) ? $webinar->start_date : $webinar->created_at,'j M Y') }}</span>
                </div>
            </div>

            <div class="user-inline-avatar d-flex align-items-center">
                <div class="avatar bg-gray200">
                    <img src="{{ $webinar->teacher->getAvatar() }}" class="img-cover" alt="{{ $webinar->teacher->full_name }}">
                </div>
                <a href="{{ $webinar->teacher->getProfileUrl() }}" target="_blank" class="user-name ml-5 font-14">{{ $webinar->teacher->full_name }}</a>
            </div>

            <div class="webinar-price-box">
                @if(!empty($isRewardCourses) and !empty($webinar->points))
                    <span class="text-warning real font-12">{{ $webinar->points }} {{ trans('update.points') }}</span>
                @elseif(!empty($webinar->price) and $webinar->price > 0)
                    @if($webinar->bestTicket() < $webinar->price)
                        <span class="real">{{ handlePrice($webinar->bestTicket(), true, true, false, null, true) }}</span>
                        <span class="off ml-10">{{ handlePrice($webinar->price, true, true, false, null, true) }}</span>
                    @else
                        <span class="real">{{ handlePrice($webinar->price, true, true, false, null, true) }}</span>
                    @endif
                @else
                    <span class="real font-12">{{ trans('public.free') }}</span>
                @endif
            </div>
        </figcaption>
    </figure>
</div>
