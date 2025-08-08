<!-- Breadcrumb Start Here -->
<div class="breadcrumb m-0">
    <div class="bg--thumb-one position-absolute">
        <img src="{{ asset($activeTemplateTrue . 'images/shape/shape-1.png')  }}" alt="@lang('image')">
    </div>
    <div class="bg--thumb-two position-absolute">
        <img src="{{ asset($activeTemplateTrue . 'images/shape/whychoose-bg2.png') }}" alt="@lang('image')">
      </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb--wrapper">
                    <h2 class="breadcrumb--title">{{__($pageTitle)}}</h2>
                    <ul class="breadcrumb--list">
                        <li class="breadcrumb--item"><a href="{{route('home')}}" class="breadcrumb--link">@lang('Home')</a></li>
                        <li class="breadcrumb--icon"><i class="fa-solid fa-circle"></i></li>
                        <li class="breadcrumb--item"><span class="breadcrumb--item--text"> {{__($pageTitle)}}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Breadcrumb End Here -->