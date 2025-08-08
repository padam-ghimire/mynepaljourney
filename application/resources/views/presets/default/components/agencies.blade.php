@forelse ($agencies as $agency)
<div class="col-xxl-3 col-xl-3 col-lg-3 col-md-4">
    <div
        class="feature--card position-relative w--100 base--radius d-flex flex-column justify-content-end align-items-center">
        <a href="{{ route('seller.profile', ['id' => $agency->id,'slug' => slug($agency->username)]) }}"
            class="thumb--wrap position-absolute d-flex justify-content-center align-items-center radius--50 overflow-hidden">
            <img class="fit--img radius--50" src="{{ getImage(getFilePath('agencyProfile').'/'.$agency->image,getFileSize('agencyProfile')) }}" alt="@lang('image')">
        </a>
        <a href="{{ route('seller.profile', ['id' => $agency->id,'slug' => slug($agency->username)]) }}" class="content--wrap mb-30 px-3">
            <h6 class="text-center mb-0">{{$agency->fullname}}</h6>
        </a>
        <div class="footer w--100 d-flex justify-content-between">
            <div class="d-flex gap--12 justify-content-start align-items-center">
                <i class="fa-solid fa-image"></i>
                <p>{{$agency->artwork_count}}</p>
            </div>
            <div class="d-flex gap--12 justify-content-end align-items-center">
                <a href="{{ route('seller.profile', ['id' => $agency->id,'slug' => slug($agency->username)]) }}" class="circle-icon"> <i class="fa-solid fa-circle-plus"></i></a>
                <a href="{{ route('seller.profile', ['id' => $agency->id,'slug' => slug($agency->username)]) }}" class="arrow-icon"> <i class="fa-solid fa-arrow-down-long"></i></a>
            </div>
        </div>
    </div>
</div>
@empty
    <p class="text-center">{{__($emptyMessage)}}</p>
@endforelse
