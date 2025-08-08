@forelse ($blogs as $item)
    <div class="col-xl-4 col-lg-6 col-md-6">
        <div class="blog-card position-relative bg--white radius--20">

            <div class="bg--element position-absolute">
                <img src="{{ asset($activeTemplateTrue . 'images/shape/whychoose-bg2.png') }}" alt="image">
            </div>
            <div class="thumb--wrap position-relative">

                <div class="thumb">
                    <img class="fit--img"
     src="{{ getImage(getFilePath('frontend') . '/blog/thumb_' . ($item->data_values->blog_image ?? 'default.jpg')) }}"
     alt="image">
                </div>

                <div class="date--wrap d-flex justify-content-start align-items-center position-absolute">
                    <p class="text--white fs--14 fw--500"><i class="fa-solid fa-calendar-days"></i>
                        {{ showDateTime($item->created_at,'d M Y') }}</p>
                </div>
            </div>


            <div class="blog-content">

                <a href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id]) }}">
                    <h5 class="title fs--24 fw--600">
                        @if (strlen(__($item->data_values->title)) > 50)
                            {{ substr(__($item->data_values->title), 0, 50) . '...' }}
                        @else
                            {{ __($item->data_values->title) }}
                        @endif
                    </h5>
                </a>
                <p class="mb-20">
                    @if (strlen(__(strip_tags($item->data_values->description))) > 40)
                        {{ substr(__(strip_tags($item->data_values->description)), 0, 40) . '...' }}
                    @else
                        {{ __(strip_tags($item->data_values->description)) }}
                    @endif
                </p>
                <div class="blog-card__btn-wrap">
                    <a href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id]) }}"
                        class="text--base"><i class="fa-solid fa-arrow-right-long"></i> @lang('Read more')</a>
                </div>
            </div>
        </div>
    </div>
    @empty
    <p class="text-center">@lang('No data found')</p>
@endforelse
