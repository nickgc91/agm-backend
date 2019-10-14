class JournalingsController < ApplicationController

    wrap_parameters :journaling, include: [:title, :text]

    def createNewJournalEntry
        user = get_current_user
        journal = Journaling.new(title: new_journal_params[:title], text: new_journal_params[:text], user_id: user.id)

        if journal.save 
            render json: { title: journal.title }, status: :created
        else
            render json: { journal_errors: journal.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    private

    def new_journal_params
        params.require(:journaling).permit(:title, :text)
    end

end
