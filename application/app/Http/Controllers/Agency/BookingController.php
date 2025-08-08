<?php

namespace App\Http\Controllers\Agency;

use App\Models\User;
use App\Models\TourBooking;
use App\Models\TourPackage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BookingController extends Controller
{
    public function bookingTourPackageList(Request $request)
    {
        $pageTitle = 'My Package-List';
        $bookingTourPackages = $this->tourPackageData('agencyAll');

        return view($this->activeTemplate . 'agency.tour_booking.my_booked', compact('pageTitle', 'bookingTourPackages'));
    }

    public function pending()
    {
        $pageTitle = 'Agency Pending Package-List';
        $bookingTourPackages = $this->tourPackageData('agencyPending');
        return view($this->activeTemplate . 'agency.tour_booking.my_booked', compact('pageTitle', 'bookingTourPackages'));
    }

    public function approved()
    {
        $pageTitle = 'Agency Approved Package-List';
        $bookingTourPackages = $this->tourPackageData('agencyApproved');
        return view($this->activeTemplate . 'agency.tour_booking.my_booked', compact('pageTitle', 'bookingTourPackages'));
    }

    public function canceled()
    {
        $pageTitle = 'Agency Canceled Package-List';
        $bookingTourPackages = $this->tourPackageData('agencyCanceled');
        return view($this->activeTemplate . 'agency.tour_booking.my_booked', compact('pageTitle', 'bookingTourPackages'));
    }


    public function bookingDetails($id)
    {
        $pageTitle = 'Tour & Booking Details';
        $bookingDetails = TourBooking::with(['user','owner','admin', 'tour_package','tour_package.category'])
            ->where('id', $id)
            ->where('owner_id', auth('agency')->id())
            ->where('owner_type', 'agency')
            ->first();
        return view($this->activeTemplate . 'agency.tour_booking.details', compact('pageTitle', 'bookingDetails'));
    }

    protected function tourPackageData($scope = null)
    {
        if ($scope) {
            $bookingTourPackages = TourPackage::$scope();
        } else {
            $bookingTourPackages = TourPackage::query();
        }
        //search
        $request = request();
        if ($request->search) {
            $search = $request->search;
            $bookingTourPackages  = $bookingTourPackages->with('tour_bookings.deposit')
                ->where('title', 'like', "%$search%");
        }
        return $bookingTourPackages->with('tour_bookings.deposit', 'tour_bookings.user', 'tour_bookings.owner', 'TourPackagePrimaryImage')->orderBy('id', 'desc')->paginate(getPaginate());
    }


    public function userList(Request $request, $id)
    {
        $pageTitle = 'User Booking-List';
        $tourBookings = TourBooking::with('user', 'tour_package')->where('tour_package_id', $id)->where('owner_id', auth('agency')->id())
            ->where('owner_type', 'agency')
            ->orderBy('id', 'desc')
            ->paginate(getPaginate());

        if ($request->search) {
            $search = $request->search;
            $tourBookings  = TourBooking::with('tour_package', 'user')
                ->whereHas('user', function ($query) use ($search) {
                    $query->where('firstname', 'like', "%$search%")->orWhere('lastname','like',"%$search%")->orWhere('username','like',"%$search%");
                })->where('owner_id', auth('agency')->id())
                ->where('owner_type', 'agency')
                ->orderBy('id', 'desc')
                ->paginate(getPaginate());
        }
        return view($this->activeTemplate . 'agency.tour_booking.my_booked_user_list', compact('pageTitle', 'tourBookings'));
    }
}
