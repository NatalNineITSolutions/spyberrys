@extends('admin.layouts.app')

@section('css')
    <style>
        .container {
            display: flex;
            flex-direction: column
        }

        .submit {
            align-self: flex-end;
            margin-top: 25px;
            padding: 10px 20px;
            background-color: #6777EF;
            border: none;
            outline: none;
            border-radius: 25px;
            color: white;
            font-size: 15px;
            font-weight: 600;
        }
    </style>
@endsection

@section('content')
    <div class="container" style="margin-top: 3rem;">
        <form action="{{ route('sandbox.store') }}" method="POST">
            @csrf
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="apiKey" class="input-label">API Key</label>
                        <input type="text" class="form-control" id="apiKey" name="apiKey" placeholder="Enter API Key">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="secretKey" class="input-label">Secret Key</label>
                        <input type="text" class="form-control" id="secretKey" name="secretKey" placeholder="Enter Secret Key">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="version" class="input-label">Version</label>
                        <input type="text" class="form-control" id="version" name="version" placeholder="Enter Version">
                    </div>
                </div>
            </div>
            <button type="submit" class="submit">Submit</button>
        </form>
        
    </div>
@endsection
