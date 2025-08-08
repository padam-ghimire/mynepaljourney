<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> {{ $general->siteName(__('403')) }}</title>
    <link rel="shortcut icon" href="{{ getImage(getFilePath('logoIcon') .'/favicon.png') }}" type="image/x-icon">
    <link href="{{ asset('assets/common/css/bootstrap.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue . 'css/main.css')}}">
</head>

<body>
    <section class="error--page  d-flex justify-content-center align-items-center">
        <div class="bgg--element position-absolute d-none d-md-block">
            <img class="" src="{{ asset($activeTemplateTrue . 'images/shape/element-9.png') }}" alt="image">
        </div>

        <div class="bg--element-two position-absolute">
            <img src="{{asset($activeTemplateTrue . 'images/shape/element-10.png')}}" alt="image">
        </div>

        <div class="container">
            <div class="row gy-5 justify-content-center align-items-center">
                <div class="col-lg-6">

                    <div class="error-wrap text-start">
                        <div class="error--text">
                            <span>4</span>
                            <span>0</span>
                            <span>4</span>
                        </div>
                        <h2 class="title text-center mb-3">@lang('Not Found')</h2>
                        <p class="desc text-center">@lang('Page you are looking have been deleted or does not exist') <a
                                href="{{route('home')}}" class="text--base-two">@lang('Try something else')?</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>