@php
    $socials = getSocials();
    if (!empty($socials) and count($socials)) {
        $socials = collect($socials)->sortBy('order')->toArray();
    }

    $footerColumns = getFooterColumns();
@endphp

<footer class="footer position-relative user-select-none">
    {{--   --}}

    @php
        $columns = ['first_column','second_column','third_column','forth_column'];
    @endphp

    <div class="container">
        <div class="row">

            <div class="col-lg-3 col-md-12 col-12">
                <div class="logo">
                    <img src="./assets/default/img/home/logo.png" alt="" style="width: 160px;">
                    <p>Top learning experiences that create more talent in the world.</p>
                </div>
            </div>

            <div class="col-lg-9 col-md-12 col-12">
                <div class="row">
                    @foreach($columns as $column)
                        <div class="col-6 col-md-3">
                            @if(!empty($footerColumns[$column]))
                                @if(!empty($footerColumns[$column]['title']))
                                    <span class="header d-block text-white font-weight-bold">{{ $footerColumns[$column]['title'] }}</span>
                                @endif

                                @if(!empty($footerColumns[$column]['value']))
                                    <div class="mt-20" style="font-family: 'Montserrat';">
                                        {!! $footerColumns[$column]['value'] !!}
                                    </div>
                                @endif
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>

        </div>

        {{-- <div class="mt-40 border-blue py-25 d-flex align-items-center justify-content-between">
            <div class="footer-logo">
                <a href="/">
                    @if(!empty($generalSettings['footer_logo']))
                        <img src="{{ $generalSettings['footer_logo'] }}" class="img-cover" alt="footer logo">
                    @endif
                </a>
            </div>

            <div class="footer-social">
                @if(!empty($socials) and count($socials))
                    @foreach($socials as $social)
                        <a href="{{ $social['link'] }}" target="_blank">
                            <img src="{{ $social['image'] }}" alt="{{ $social['title'] }}" class="mr-15">
                        </a>
                    @endforeach
                @endif
            </div>
        </div> --}}
    </div>

    @if(getOthersPersonalizationSettings('platform_phone_and_email_position') == 'footer')
        <div class="footer-copyright-card">
            <div class="container d-flex align-items-center justify-content-between py-15 copyright">
                <div class="font-14 text-white">{{ trans('update.platform_copyright_hint') }}</div>

                <div class="d-flex align-items-center justify-content-center contact">
                    @if(!empty($generalSettings['site_phone']))
                        <div class="d-flex align-items-center text-white font-14">
                            <i data-feather="phone" width="20" height="20" class="mr-10"></i>
                            {{ $generalSettings['site_phone'] }}
                        </div>
                    @endif

                    @if(!empty($generalSettings['site_email']))
                        <div class="border-left mx-5 mx-lg-15 h-100"></div>

                        <div class="d-flex align-items-center text-white font-14">
                            <i data-feather="mail" width="20" height="20" class="mr-10"></i>
                            {{ $generalSettings['site_email'] }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    @endif

</footer>
