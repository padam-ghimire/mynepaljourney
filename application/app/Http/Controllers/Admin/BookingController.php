<?php

namespace App\Http\Controllers\Admin;

use App\Models\TourBooking;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\TourPackage;

class BookingController extends Controller
{
    public function bookingTourPackageList(Request $request)
    {
        $pageTitle = 'My Tour-List';
        $bookingTourPackages = $this->tourPackageData('adminAll');
        return view('admin.booking.index', compact('pageTitle', 'bookingTourPackages'));
    }

    public function bookingTourPackagePending()
    {
        $pageTitle = 'Admin Pending Booking-List';
        $bookingTourPackages = $this->tourPackageData('adminPending');
        return view('admin.booking.index', compact('pageTitle', 'bookingTourPackages'));
    }

    public function bookingTourPackageApproved()
    {
        $pageTitle = 'Admin Active Booking-List';
        $bookingTourPackages = $this->tourPackageData('adminApproved');
        return view('admin.booking.index', compact('pageTitle', 'bookingTourPackages'));
    }

    public function bookingTourPackageCanceled()
    {
        $pageTitle = 'Admin Canceled Booking-List';
        $bookingTourPackages = $this->tourPackageData('adminCanceled');
        return view('admin.booking.index', compact('pageTitle', 'bookingTourPackages'));
    }

    public function bookingAgencyList()
    {
        $pageTitle = 'Agency Booking-List';
        $bookingTourPackages = $this->tourPackageData('adminAgencyAll');
        return view('admin.booking.index', compact('pageTitle', 'bookingTourPackages'));
    }

    public function userList(Request $request, $id)
    {
        $pageTitle = 'User Booking-List';
        $tourBookings = TourBooking::with('user', 'tour_package')
        ->where('tour_package_id', $id)
        ->where('owner_id', auth('admin')->id())
        ->where('owner_type', 'admin')
        ->paginate(getPaginate());

        if ($request->search) {
           
            $search = $request->search;
            $tourBookings  = TourBooking::with('tour_package', 'user')
                ->whereHas('user', function ($query) use ($search) {
                    $query->where('username', 'like', "%$search%");
                })->where('owner_id', auth('admin')->id())
                ->where('owner_type', 'admin')
                ->paginate(getPaginate());
        }
        return view('admin.booking.my_booked_user_list', compact('pageTitle', 'tourBookings'));
    }

    public function bookingDetails($id)
    {
        $pageTitle = 'Tour & Booking Details';
        $bookingDetails = TourBooking::with(['user','owner','admin', 'tour_package','tour_package.category'])
            ->where('id', $id)
            ->first();
        return view('admin.booking.details', compact('pageTitle', 'bookingDetails'));
    }


    public function agencyBookedUserList(Request $request, $id)
    {
        $pageTitle = 'User Booking-List';
        $tourBookings = TourBooking::with('user', 'tour_package')
        ->where('tour_package_id', $id)
        ->where('owner_type', 'agency')
        ->paginate(getPaginate());

        if ($request->search) {
            $search = $request->search;
            $tourBookings  = TourBooking::with('tour_package', 'user')
                ->whereHas('user', function ($query) use ($search) {
                    $query->where('username', 'like', "%$search%");
                })
                ->where('owner_type', 'agency')
                ->paginate(getPaginate());
        }
        return view('admin.booking.my_booked_user_list', compact('pageTitle', 'tourBookings'));
    }


    protected function tourPackageData($scope = null)
    {
        if ($scope) {
            $bookingTourPackage = TourPackage::$scope();
        } else {
            $bookingTourPackage = TourPackage::query();
        }
        //search
        $request = request();
        if ($request->search) {
            $search = $request->search;
            $bookingTourPackage  = $bookingTourPackage->with('tour_bookings.deposit')
                ->where('title', 'like', "%$search%");
        }
        return $bookingTourPackage->with('tour_bookings.deposit', 'tour_bookings.user', 'tour_bookings.owner', 'TourPackagePrimaryImage')->orderBy('id', 'desc')->paginate(getPaginate());
    }
}
